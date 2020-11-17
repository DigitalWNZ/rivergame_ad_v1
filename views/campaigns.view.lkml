include: "campaign_conversion_report.view.lkml"

view: campaigns {
  derived_table: {
    sql: SELECT
        customer_currency_code,
        CASE
          WHEN camp.campaign_target_roas_target_roas IS NOT NULL THEN CONCAT(CAST(ROUND(camp.campaign_target_roas_target_roas*100,2) AS string),"%")
        ELSE
        " - "
      END
        AS campaign_target_roas_target_roas,
        campaign_id,
        campaign_name,
        customer_descriptive_name,
        campaign_status,
        customer_id,
        campaign_budget_amount_micros,
        campaign_app_campaign_setting_app_id,
        campaign_app_campaign_setting_app_store,
        camp.campaign_app_campaign_setting_bidding_strategy_goal_type,
        segments_date,
        conv.installs,
        conv.in_app_actions,
        ROUND(perf.metrics_cost_micros/1e6,2) metrics_cost,
        CASE
          WHEN campaign_app_campaign_setting_bidding_strategy_goal_type = 'OPTIMIZE_INSTALLS_TARGET_INSTALL_COST' AND camp.campaign_budget_amount_micros/campaign_target_cpa_target_cpa_micros < 50 THEN 'Budget < 50x CPI'
          WHEN campaign_app_campaign_setting_bidding_strategy_goal_type = 'OPTIMIZE_IN_APP_CONVERSIONS_TARGET_CONVERSION_COST'
        AND camp.campaign_budget_amount_micros/campaign_target_cpa_target_cpa_micros < 10 THEN 'Budget < 10x CPA'
        ELSE
        'PASS'
      END
        AS budget_excellence_reason,
        IFNULL(perf.metrics_impressions,
          0) metrics_impressions,
        IFNULL(perf.metrics_clicks,
          0) metrics_clicks,
        IFNULL(perf.metrics_interactions,
          0) metrics_interactions,
        IFNULL(CONCAT(CAST(ROUND(campaign_target_cpa_target_cpa_micros/1e6,2) AS string)," ", customer_currency_code),
          " - ") campaign_target_cpa_target_cpa
      FROM
        `rg-testing-20200528.google_ads_data.campaigns` camp
      INNER JOIN (
        SELECT
          campaign_id,
          segments_date,
          MAX( partition_time ) partition_time
        FROM
          `rg-testing-20200528.google_ads_data.campaigns`
        WHERE
          campaign_app_campaign_setting_app_id IS NOT NULL
        GROUP BY
          1,
          2 )
      USING
        (campaign_id,
          segments_date,
          partition_time)
      LEFT JOIN (
        SELECT
          campaign_id,
          segments_date,
          SUM(
          IF
            (segments_conversion_action_category = "DOWNLOAD",
              metrics_conversions,
              0)) installs,
          SUM(
          IF
            (segments_conversion_action_category != "DOWNLOAD",
              metrics_conversions,
              0)) in_app_actions
        FROM
          `rg-testing-20200528.google_ads_data.campaign_conversion_report`
        WHERE
          partition_time IN (
          SELECT
            MAX(partition_time) partition_time
          FROM
            `rg-testing-20200528.google_ads_data.campaign_conversion_report`)
        GROUP BY
          1,
          2 ) conv USING (campaign_id, segments_date)
      LEFT JOIN (
        SELECT
          campaign_id,
          segments_date,
          SUM(metrics_cost_micros) metrics_cost_micros,
          SUM(metrics_impressions) metrics_impressions,
          SUM(metrics_clicks) metrics_clicks,
          SUM(metrics_interactions) metrics_interactions
        FROM
          `rg-testing-20200528.google_ads_data.campaign_network_report`
        WHERE
          partition_time IN (
          SELECT
            MAX(partition_time) partition_time
          FROM
            `rg-testing-20200528.google_ads_data.campaign_network_report`)
        GROUP BY
          1,
          2 ) perf
      USING
        (campaign_id,
          segments_date)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # start

  measure: sum_in_app_actions {
    label: "In-App Actions"
    type: sum
    sql: ${in_app_actions} ;;
  }

  measure: sum_installs {
    label: "Installs"
    type: sum
    sql: ${installs} ;;
  }

  measure: cpa {
    label: "CPA"
    type: number
    # value_format_name: decimal_2
    value_format: "$0.00"
    sql: if (${sum_in_app_actions}=0,0,${sum_cost}/${sum_in_app_actions}) ;;
  }

  measure: cpi {
    label: "CPI"
    type: number
    # value_format_name: decimal_2
    value_format: "$0.00"
    sql:if(${sum_installs}=0,0, ${sum_cost}/${sum_installs} );;
  }

  measure: sum_cost{
    label: "Cost"
    value_format: "$0.00"
    type: sum
    sql: ${metrics_cost} ;;
  }

  measure: sum_camp_budget_amount {
    label: "Budget"
    type: sum
    sql: ${campaign_budget_amount} ;;
    value_format: "$0.00"
  }

  measure: cost_by_budget {
    label: "Cost/Budget"
    type: number
    value_format_name: decimal_2
    sql: ${sum_cost}/${sum_camp_budget_amount} ;;
  }

  measure: budget_utilization {
    label: "Budget Utilization"
    type: number
    value_format_name: percent_2
    sql: ${sum_cost}/${sum_camp_budget_amount} ;;
  }

  measure: campaigns {
    label: "Campaigns"
    type: count_distinct
    sql: ${campaign_id} ;;
  }

  measure: roas {
    label: "ROAS"
    type: number
    value_format_name: percent_2
    sql: if (${sum_cost}=0,0,${campaign_conversion_report.SQL_TABLE_NAME.sum_conversion_value}/${sum_cost});;
  }

  dimension: date_diff {
    type: number
    sql: date_diff(current_date(),${segments_date},day) ;;
  }

  dimension: period {
    type: string
    sql:
     CASE
        WHEN ${date_diff} > 0 and ${date_diff} <=7 THEN "Current Period"
        WHEN ${date_diff} > 7 and ${date_diff} <=14 THEN "Last Period"
        ELSE "Other"
      END
    ;;
  }

  dimension: camp_type {
    label: "Camp.Type"
    type: string
    sql:
      case
        when ${campaign_app_campaign_setting_bidding_strategy_goal_type} = "OPTIMIZE_INSTALLS_TARGET_INSTALL_COST" then "AC for Install 1.0"
        when ${campaign_app_campaign_setting_bidding_strategy_goal_type} = "OPTIMIZE_IN_APP_CONVERSIONS_TARGET_CONVERSION_COST" then "AC for Action"
        when ${campaign_app_campaign_setting_bidding_strategy_goal_type} = "OPTIMIZE_IN_APP_CONVERSIONS_TARGET_INSTALL_COST" then "Ac for Install 2.0"
        when ${campaign_app_campaign_setting_bidding_strategy_goal_type} = "OPTIMIZE_RETURN_ON_ADVERTISING_SPEND" then "AC for Value"
        else "Unknown"
      end ;;
  }

  dimension: campaign_budget_amount {
    type: number
    value_format_name: decimal_2
    sql: ${campaign_budget_amount_micros}/1000000 ;;
  }

  dimension: campaign_link {
    type: string
    sql: HYPERLINK(CONCAT("https://ads.google.com/aw/overview?campaignId=",${campaign_id}, "&ocid=", ${customer_id}), ${campaign_id}) ;;
  }

  dimension: target {
    label: "Target"
    sql:
      case
        when ${campaign_app_campaign_setting_bidding_strategy_goal_type} = "OPTIMIZE_RETURN_ON_ADVERTISING_SPEND" then ${campaign_target_roas_target_roas}
        else ${campaign_target_cpa_target_cpa}
      end  ;;
  }

  # end

  dimension: customer_currency_code {
    type: string
    sql: ${TABLE}.customer_currency_code ;;
  }

  dimension: campaign_target_roas_target_roas {
    type: string
    sql: ${TABLE}.campaign_target_roas_target_roas ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    link:{
      label: "View Campaign {{value}} on google ads"
      url: "https://ads.google.com/aw/overview?campaignId={{value}}&ocid={{customer_id._value}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: campaign_budget_amount_micros {
    type: number
    sql: ${TABLE}.campaign_budget_amount_micros ;;
  }

  dimension: campaign_app_campaign_setting_app_id {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_app_id ;;
  }

  dimension: campaign_app_campaign_setting_app_store {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_app_store ;;
  }

  dimension: campaign_app_campaign_setting_bidding_strategy_goal_type {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_bidding_strategy_goal_type ;;
  }

  dimension: segments_date {
    type: date
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: installs {
    type: number
    sql: ${TABLE}.installs ;;
  }

  dimension: in_app_actions {
    type: number
    sql: ${TABLE}.in_app_actions ;;
  }

  dimension: metrics_cost {
    type: number
    sql: ${TABLE}.metrics_cost ;;
  }

  dimension: budget_excellence_reason {
    type: string
    sql: ${TABLE}.budget_excellence_reason ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_interactions {
    type: number
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: campaign_target_cpa_target_cpa {
    type: string
    sql: ${TABLE}.campaign_target_cpa_target_cpa ;;
  }

  set: detail {
    fields: [
      customer_currency_code,
      campaign_target_roas_target_roas,
      campaign_id,
      campaign_name,
      customer_descriptive_name,
      campaign_status,
      customer_id,
      campaign_budget_amount_micros,
      campaign_app_campaign_setting_app_id,
      campaign_app_campaign_setting_app_store,
      campaign_app_campaign_setting_bidding_strategy_goal_type,
      segments_date,
      installs,
      in_app_actions,
      metrics_cost,
      budget_excellence_reason,
      metrics_impressions,
      metrics_clicks,
      metrics_interactions,
      campaign_target_cpa_target_cpa
    ]
  }
}
