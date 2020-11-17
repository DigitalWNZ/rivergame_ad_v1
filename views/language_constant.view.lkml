include: "navigation_bar.view.lkml"
view: language_constant {
  sql_table_name: `rg-testing-20200528.google_ads_data.language_constant`
    ;;
    extends: [navigation_bar]
  drill_fields: [language_constant_id]

  dimension: language_constant_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.language_constant_id ;;
  }

  dimension: cid {
    type: string
    sql: ${TABLE}.cid ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.create_time ;;
  }

  dimension: language_constant_code {
    type: string
    sql: ${TABLE}.language_constant_code ;;
  }

  dimension: language_constant_name {
    type: string
    sql: ${TABLE}.language_constant_name ;;
  }

  dimension: page_id {
    type: number
    sql: ${TABLE}.pageId ;;
  }

  dimension_group: partition {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.partition_time ;;
  }

  measure: count {
    type: count
    drill_fields: [language_constant_id, language_constant_name]
  }
}
