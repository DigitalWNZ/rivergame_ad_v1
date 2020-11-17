view: geo_conversion_report {
  derived_table: {
    sql: SELECT
        campaign_id,
        segments_date,
        geographic_view_country_criterion_id,
        segments_conversion_action_name,
        SUM(metrics_conversions_value) metrics_conversions_value,
        SUM(metrics_all_conversions_value) metrics_all_conversions_value,
        SUM(metrics_conversions) metrics_conversions,
        SUM(metrics_all_conversions)metrics_all_conversions
      FROM
          `google_ads_data.geo_conversion_report`
        WHERE
          partition_time IN (
          SELECT
            MAX(partition_time)
          FROM
            `google_ads_data.geo_conversion_report`)
      GROUP BY
        1,
        2,
        3,
        4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # start
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

  dimension: geographic_view_country_criterion_id {
    type: string
    sql: ${TABLE}.geographic_view_country_criterion_id ;;
  }

  dimension: segments_conversion_action_name {
    label: "Conv.Name"
    type: string
    sql: ${TABLE}.segments_conversion_action_name ;;
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
      geographic_view_country_criterion_id,
      segments_conversion_action_name,
      metrics_conversions_value,
      metrics_all_conversions_value,
      metrics_conversions,
      metrics_all_conversions
    ]
  }
}
