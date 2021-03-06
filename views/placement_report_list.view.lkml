view: placement_report_list {
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
      SELECT
        p.*,
        camp.campaign_name,
        camp.campaign_status,
        camp.campaign_app_campaign_setting_app_id app_id,
      FROM (
        SELECT
          *,
          PERCENT_RANK() OVER (PARTITION BY segments_date, campaign_id ORDER BY metrics_cost DESC) rank
        FROM (
          SELECT
            group_placement_view_placement_type,
            segments_date,
            campaign_id,
            group_placement_view_display_name,
            group_placement_view_target_url,
            ROUND(SUM(metrics_cost_micros/1e6),2) metrics_cost,
            SUM(metrics_impressions) metrics_impressions,
            SUM(metrics_clicks) metrics_clicks,
            SUM(metrics_conversions) metrics_conversions,
            SUM(metrics_conversions_value) metrics_conversions_value
          FROM
            `google_ads_data.placement_report*`
          WHERE
            partition_time IN (
            SELECT
              MAX(partition_time)
            FROM
              `google_ads_data.placement_report*`)
          GROUP BY
            1,
            2,
            3,
            4,
            5)) p
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
        p.rank < 0.2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
# start

  measure: sum_cost {
    label: "Cost"
    value_format: "$0.00"
    type: sum
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
    sql:if (${sum_clicks}=0,0, ${sum_cost}/${sum_clicks} );;
  }

  measure: ctr {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: if (${sum_impressions}=0,0,${sum_clicks}/${sum_impressions}) ;;
  }

  measure: cvr {
    label: "CVR"
    type: number
    value_format_name: percent_2
    sql: if (${sum_clicks}=0,0,${sum_conversions}/${sum_clicks}) ;;
  }

  measure: roas {
    label: "ROAS"
    type: number
    value_format_name: percent_2
    sql:if (${sum_cost}=0,0, ${sum_conversions_value}/${sum_cost} );;
  }

  measure: conversion_rate {
    type: number
    value_format_name: percent_2
    sql: ${sum_conversions}/${sum_clicks} ;;
  }

  measure: cpi {
    label: "CPI"
    type: number
    value_format_name: decimal_2
    sql:if( ${sum_conversions}=0,0, ${sum_cost}/${sum_conversions}) ;;
  }

  measure: placements {
    label: "Placements"
    type: count_distinct
    sql: ${group_placement_view_target_url} ;;
  }


  measure: campaigns {
    label: "Campaigns"
    type: count_distinct
    sql: ${campaign_id} ;;
  }


  # dimension: placement {
  #   label: "Placement"
  #   type: string
  #   sql: HYPERLINK(${group_placement_view_target_url}, ${group_placement_view_display_name}) ;;
  # }

  dimension: placement_type_display {
    label: "Placement Type"
    type: string
    sql:
      case
        when ${group_placement_view_placement_type} = "UNSPECIFIED"   then "UNSPECIFIED"
        when ${group_placement_view_placement_type} = "UNKNOWN"  then "UNKNOWN"
        when ${group_placement_view_placement_type} = "WEBSITE"  then "Website"
        when ${group_placement_view_placement_type} = "MOBILE_APP_CATEGORY" then "Mobile App Category"
        when ${group_placement_view_placement_type} = "MOBILE_APPLICATION" then "Mobile App"
        when ${group_placement_view_placement_type} = "YOUTUBE_VIDEO" then "Youtube Video"
        else "Youtube Channel"
      end
    ;;
  }

  # end

  dimension: group_placement_view_placement_type {
    type: string
    sql: ${TABLE}.group_placement_view_placement_type ;;
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

  dimension: group_placement_view_display_name {
    label: "Placement"
    type: string
    sql: ${TABLE}.group_placement_view_display_name ;;
    link: {
      label: "View {{value}}"
      url: "{{group_placement_view_target_url._value}}"
    }
  }

  dimension: group_placement_view_target_url {
    type: string
    sql: ${TABLE}.group_placement_view_target_url ;;
  }

  dimension: metrics_cost {
    type: number
    sql: ${TABLE}.metrics_cost ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
  }

  set: detail {
    fields: [
      group_placement_view_placement_type,
      segments_date,
      campaign_id,
      group_placement_view_display_name,
      group_placement_view_target_url,
      metrics_cost,
      metrics_impressions,
      metrics_clicks,
      metrics_conversions,
      metrics_conversions_value,
      rank,
      campaign_name,
      campaign_status,
      app_id
    ]
  }
}
