view: placement_conversion_report {
  derived_table: {
    sql: with plist AS (
      SELECT
          *,
          PERCENT_RANK() OVER (PARTITION BY segments_date, campaign_id ORDER BY metrics_cost DESC) rank
        FROM (
          SELECT
            segments_date,
            campaign_id,
            group_placement_view_target_url,
            ROUND(SUM(metrics_cost_micros/1e6),2) metrics_cost
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
            3) )
      SELECT
        campaign_id,
        segments_date,
        segments_conversion_action_name,
        group_placement_view_target_url,
        group_placement_view_display_name,
        SUM(metrics_conversions_value) metrics_conversions_value,
        SUM(metrics_all_conversions_value) metrics_all_conversions_value,
        SUM(metrics_conversions) metrics_conversions,
        SUM(metrics_all_conversions) metrics_all_conversions
        FROM
         `google_ads_data.placement_conversion_report*`
         INNER JOIN plist USING(campaign_id, segments_date, group_placement_view_target_url)
        WHERE
          partition_time IN (
          SELECT
            MAX(partition_time)
          FROM
            `google_ads_data.placement_conversion_report*`)
            and plist.rank < 0.001
      GROUP BY
        1,
        2,
        3,
        4,5
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # start
  # dimension: placement {
  #   type: string
  #   sql:HYPERLINK(${group_placement_view_target_url},${group_placement_view_display_name});;
  # }

  measure: sum_conversions {
    label: "Conversions"
    type: sum
    sql: ${metrics_conversions} ;;
  }

  measure: sum_conversion_value {
    label: "Conv.Value"
    value_format: "$0.00"
    type: sum
    sql: ${metrics_conversions_value} ;;
  }

  measure: sum_all_conversions {
    label: "All Conv."
    type: sum
    sql: ${metrics_all_conversions};;
  }

  measure: sum_all_conversion_value {
    label: "All Conv.Value"
    value_format: "$0.00"
    type: sum
    sql: ${metrics_all_conversions_value} ;;
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

  dimension: segments_conversion_action_name {
    label: "Conv.Name"
    type: string
    sql: ${TABLE}.segments_conversion_action_name ;;
  }

  dimension: group_placement_view_target_url {
    type: string
    sql: ${TABLE}.group_placement_view_target_url ;;
  }

  dimension: group_placement_view_display_name {
    type: string
    sql: ${TABLE}.group_placement_view_display_name ;;
    link: {
      label: "View {{value}}"
      url: "{{group_placement_view_target_url._value}}"
    }
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_all_conversions_value {
    type: number
    sql: ${TABLE}.metrics_all_conversions_value ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_all_conversions {
    type: number
    sql: ${TABLE}.metrics_all_conversions ;;
  }

  set: detail {
    fields: [
      campaign_id,
      segments_date,
      segments_conversion_action_name,
      group_placement_view_target_url,
      group_placement_view_display_name,
      metrics_conversions_value,
      metrics_all_conversions_value,
      metrics_conversions,
      metrics_all_conversions
    ]
  }
}
