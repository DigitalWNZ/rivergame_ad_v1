view: geo_report_summary {
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
            `google_ads_data.campaigns`) tmp
        INNER JOIN (
          SELECT
            campaign_id,
            MAX(IFNULL(segments_date,
                DATE(2020,01,01))) segments_date
          FROM
            `google_ads_data.campaigns`
          WHERE
            campaign_app_campaign_setting_app_id IS NOT NULL
          GROUP BY
            1)
        USING
          (campaign_id,
            segments_date) )
       --SELECT * FROM `custom-ddl.ads_data_test_0909.geo_report_summary_*`
      SELECT
      camp.customer_descriptive_name,
      camp.customer_currency_code,
      perf.segments_date,
      perf.campaign_id,
      camp.customer_id,
      camp.campaign_name,
      camp.campaign_app_campaign_setting_bidding_strategy_goal_type,
      camp.campaign_app_campaign_setting_app_store,
      camp.campaign_status,
      camp.campaign_app_campaign_setting_app_id,
      perf.geo_target_constant_canonical_name,
      perf.segments_ad_network_type,
      perf.metrics_clicks,
      perf.metrics_impressions,
      perf.metrics_conversions,
      perf.metrics_conversions_value,
      round(perf.metrics_cost_micros/1e6,2) metrics_cost
      FROM (
        SELECT campaign_id, segments_date, segments_ad_network_type, geo_target_constant_canonical_name,
        SUM(metrics_clicks) metrics_clicks,
        SUM(metrics_impressions) metrics_impressions,
        SUM(metrics_cost_micros) metrics_cost_micros,
        SUM(metrics_conversions) metrics_conversions,
        SUM(metrics_conversions_value) metrics_conversions_value
        FROM ( select distinct campaign_id, segments_date, segments_ad_network_type, geographic_view_country_criterion_id, geo_target_constant_canonical_name, metrics_clicks,metrics_impressions, metrics_cost_micros , metrics_conversions, metrics_conversions_value
        FROM `google_ads_data.geo_report_summary_*`
        WHERE partition_time IN (SELECT MAX(partition_time) FROM `google_ads_data.geo_report_summary_*`))
        GROUP BY 1,2,3,4
      ) perf
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
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # start

  measure: sum_cost {
    label: "Cost"
    type: sum
    value_format: "$0.00"
    sql: ${metrics_cost} ;;
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
    value_format: "$0.00"
    type: sum
    sql: ${metrics_conversions_value} ;;
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
    sql: if (${sum_impressions}=0,0,${sum_clicks}/${sum_impressions} );;
  }

  measure: cvr {
    label: "CVR"
    type: number
    value_format_name: percent_2
    sql:if (${sum_clicks}=0,0, ${sum_conversions}/${sum_clicks} );;
  }

  measure: roas {
    label: "ROAS"
    type: number
    value_format_name: percent_2
    sql: if (${sum_cost}=0,0,${sum_conversions_value}/${sum_cost}) ;;
  }

  measure: conversion_rate {
    type: number
    value_format_name: percent_4
    sql: ${sum_conversions}/${sum_clicks} ;;
  }


  measure: campaigns {
    label: "Campaigns"
    type: count_distinct
    sql: ${campaign_id} ;;
  }

  measure: countries {
    label: "Countries"
    type: count_distinct
    sql: ${geo_target_constant_canonical_name} ;;
  }

  dimension: platform {
    label: "Platform"
    type: string
    sql:
      case
        when ${campaign_app_campaign_setting_app_store} = "GOOGLE_APP_STORE" then "Android"
        else "iOS"
      end
    ;;
  }
  # end

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_currency_code {
    type: string
    sql: ${TABLE}.customer_currency_code ;;
  }

  dimension: segments_date {
    type: date
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
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

  dimension: geo_target_constant_canonical_name {
    label: "User Country"
    type: string
    sql: ${TABLE}.geo_target_constant_canonical_name ;;
  }

  dimension: segments_ad_network_type {
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_cost {
    type: number
    sql: ${TABLE}.metrics_cost ;;
  }

  set: detail {
    fields: [
      customer_descriptive_name,
      customer_currency_code,
      segments_date,
      campaign_id,
      customer_id,
      campaign_name,
      campaign_app_campaign_setting_bidding_strategy_goal_type,
      campaign_app_campaign_setting_app_store,
      campaign_status,
      campaign_app_campaign_setting_app_id,
      geo_target_constant_canonical_name,
      segments_ad_network_type,
      metrics_clicks,
      metrics_impressions,
      metrics_conversions,
      metrics_conversions_value,
      metrics_cost
    ]
  }
}
