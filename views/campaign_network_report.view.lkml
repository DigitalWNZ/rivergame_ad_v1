view: campaign_network_report {
  derived_table: {
    sql: WITH
        tmp AS (
        SELECT
          *
        FROM (
          SELECT
            DISTINCT customer_descriptive_name,
            customer_currency_code,
            customer_id,
            campaign_id,
            campaign_name,
            campaign_app_campaign_setting_bidding_strategy_goal_type,
            campaign_app_campaign_setting_app_store,
            campaign_status,
            partition_time,
            IFNULL(segments_date,
              DATE(2020,01,01)) segments_date,
            campaign_app_campaign_setting_app_id
          FROM
            google_ads_data.campaigns) tmp
        INNER JOIN (
          SELECT
            campaign_id,
            MAX(IFNULL(segments_date,
                DATE(2020,01,01))) segments_date
          FROM
            google_ads_data.campaigns
          WHERE
            campaign_app_campaign_setting_app_id IS NOT NULL
          GROUP BY
            1)
        USING
          (campaign_id,
            segments_date) )
      SELECT
        network.campaign_id,
        network.segments_date,
        network.metrics_clicks,
        network.metrics_conversions_value,
        network.metrics_interactions,
        metrics_impressions,
        network.metrics_cost_micros,
        segments_ad_network_type,
        metrics_conversions,
        network.cid,
        camp.customer_descriptive_name,
        camp.customer_currency_code,
        camp.customer_id,
        camp.campaign_name,
        camp.campaign_app_campaign_setting_bidding_strategy_goal_type,
        camp.campaign_app_campaign_setting_app_store,
        camp.campaign_status,
        camp.campaign_app_campaign_setting_app_id
      FROM
        google_ads_data.campaign_network_report network
      LEFT JOIN (
        SELECT
          *
        FROM
          tmp
        INNER JOIN (
          SELECT
            campaign_id,
            MAX( partition_time ) partition_time
          FROM
            tmp
          GROUP BY
            1)
        USING
          (campaign_id,
            partition_time)) camp
      USING
        (campaign_id)
      WHERE
        network.partition_time IN (
        SELECT
          MAX(partition_time)
        FROM
          google_ads_data.campaign_network_report)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # start
  measure: sum_cost {
    # value_format_name: decimal_2
    label: "Cost"
    value_format: "$0.00"
    type: sum
    sql: ${cost} ;;
  }

  measure: sum_clicks {
    label: "Clicks"
    type: sum
    sql: ${metrics_clicks} ;;
  }

  measure: sum_impressions {
    label: "Impressions"
    type: sum
    sql: ${metrics_impressions} ;;
  }

  measure: sum_conversions {
    label: "Conversions"
    type: sum
    sql: ${metrics_conversions} ;;
  }

  measure: sum_conversions_value {
    label: "Conv.Value"
    type: sum
    sql: ${metrics_conversions_value} ;;
  }

  measure: sum_interactions {
    label: "Interactions"
    type: sum
    sql: ${metrics_interactions} ;;
  }

  measure: avg_cpc {
    label: "Avg.CPC"
    type: number
    value_format_name: decimal_2
    sql: ${sum_cost}/${sum_clicks} ;;
  }

  measure: ctr {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${sum_clicks}/${sum_impressions} ;;
  }

  measure: cvr {
    label: "CVR"
    type: number
    value_format_name: percent_2
    sql: ${sum_conversions}/${sum_clicks} ;;
  }

  measure: roas {
    label: "ROAS"
    type: number
    value_format_name: percent_2
    sql: ${sum_conversions_value}/${sum_cost} ;;
  }

  measure: interaction_rate {
    label: "Interaction Rate"
    type: number
    value_format_name: percent_2
    sql: ${sum_interactions}/${sum_impressions} ;;
  }


  measure: conversion_rate {
    type: number
    value_format_name: percent_4
    sql: ${sum_conversions}/${sum_clicks} ;;
  }

  measure: cpi {
    label: "CPI"
    type: number
    value_format_name: decimal_2
    sql: ${sum_cost}/${sum_conversions} ;;
  }

  measure: campaigns {
    label: "Campaigns"
    type: count_distinct
    sql: ${campaign_id} ;;
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
    label: "Campaign Type"
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

  dimension: cost {
    label: "Cost"
    type: number
    value_format_name: decimal_2
    sql: ${metrics_cost_micros}/1000000 ;;
  }

  dimension: platform {
    label: "Platform"
    type: string
    sql:
    case
      when ${campaign_app_campaign_setting_app_store} = "APPLE_APP_STORE" then "iOS"
      when ${campaign_app_campaign_setting_app_store} = "GOOGLE_APP_STORE" then "Android"
      else ""
    end;;
  }


  # end
  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: segments_date {
    type: date
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_interactions {
    type: number
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_cost_micros {
    type: number
    sql: ${TABLE}.metrics_cost_micros ;;
  }

  dimension: segments_ad_network_type {
    label: "Network Type"
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: cid {
    type: string
    sql: ${TABLE}.cid ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_currency_code {
    type: string
    sql: ${TABLE}.customer_currency_code ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_app_campaign_setting_bidding_strategy_goal_type {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_bidding_strategy_goal_type ;;
  }

  dimension: campaign_app_campaign_setting_app_store {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_app_store ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: campaign_app_campaign_setting_app_id {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_app_id ;;
  }

  set: detail {
    fields: [
      campaign_id,
      segments_date,
      metrics_clicks,
      metrics_conversions_value,
      metrics_interactions,
      metrics_impressions,
      metrics_cost_micros,
      segments_ad_network_type,
      metrics_conversions,
      cid,
      customer_descriptive_name,
      customer_currency_code,
      customer_id,
      campaign_name,
      campaign_app_campaign_setting_bidding_strategy_goal_type,
      campaign_app_campaign_setting_app_store,
      campaign_status,
      campaign_app_campaign_setting_app_id
    ]
  }
}
