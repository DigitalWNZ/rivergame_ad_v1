view: campaign_conversion_report {
  derived_table: {
    sql: SELECT
          campaign_id,
          segments_date,
          segments_conversion_action_name,
          segments_conversion_action_category,
          IFNULL(SUM(metrics_conversions_value),0) metrics_conversions_value,
          IFNULL(SUM(metrics_all_conversions_value),0) metrics_all_conversions_value,
          IFNULL(SUM(metrics_all_conversions),0) metrics_all_conversions,
          IFNULL(SUM(metrics_conversions),0) metrics_conversions
        FROM
          google_ads_data.campaign_conversion_report
        WHERE
          partition_time IN (
          SELECT
            MAX(partition_time)
          FROM
            google_ads_data.campaign_conversion_report)
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
  measure:sum_conversion_value {
    label: "Conv.Value"
    type: sum
    value_format: "$0.00"
    sql: ${metrics_conversions_value} ;;
  }

  measure: sum_conversion {
    label: "Conv."
    type: sum
    value_format: "$0.00"
    sql: ${metrics_conversions} ;;
  }

  measure: sum_all_conversion {
    label: "All Conv"
    type: sum
    value_format: "$0.00"
    sql: ${metrics_all_conversions} ;;
  }

  measure: sum_all_conversion_value {
    label: "All Conv.Value"
    type: sum
    value_format: "$0.00"
    sql: ${metrics_all_conversions_value} ;;
  }


  measure: roas {
    label: "ROAS"
    type: number
    value_format_name: percent_2
    # sql: if (${campaigns.SQL_TABLE_NAME.sum_cost}=0,0,${sum_conversion_value}/${campaigns.SQL_TABLE_NAME.sum_cost});;
    sql: if (${campaigns.SQL_TABLE_NAME}.sum_cost=0,0,${sum_conversion_value}/${campaigns.SQL_TABLE_NAME}.sum_cost);;
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

  dimension: segments_conversion_action_category {
    type: string
    sql: ${TABLE}.segments_conversion_action_category ;;
  }



  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_all_conversions_value {
    type: number
    sql: ${TABLE}.metrics_all_conversions_value ;;
  }

  dimension: metrics_all_conversions {
    type: number
    sql: ${TABLE}.metrics_all_conversions ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  set: detail {
    fields: [
      campaign_id,
      segments_date,
      segments_conversion_action_name,
      segments_conversion_action_category,
      metrics_conversions_value,
      metrics_all_conversions_value,
      metrics_all_conversions,
      metrics_conversions
    ]
  }
}
