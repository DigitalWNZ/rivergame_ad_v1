view: disapproval_report_all {
  derived_table: {
    sql: select g.campaign_id, g.ad_group_id, g.customer_id, g.ad_group_ad_ad_id,
            CASE
                WHEN g.ad_group_ad_policy_summary.approvalStatus is null THEN 'N/A'
                ELSE g.ad_group_ad_policy_summary.approvalStatus
            END adgroup_approval_status,
            g.ad_group_ad_policy_summary.reviewStatus adgroup_review_status,
            g.ad_group_ad_ad_type,
            g.partition_time,
            CASE
                WHEN s.ad_group_ad_asset_view_policy_summary.approvalStatus is null THEN 'N/A'
                ELSE s.ad_group_ad_asset_view_policy_summary.approvalStatus
            END asset_approval_status,
            s.ad_group_ad_asset_view_policy_summary.reviewStatus asset_review_status,
            s.ad_group_ad_asset_view_field_type,
            s.asset_id, s.asset_type,
             from `google_ads_data.disapprovals_ad_group_ad` g join `google_ads_data.disapprovals_ad_group_ad_asset_view` s on s.ad_group_ad_ad_id=g.ad_group_ad_ad_id
             where g.ad_group_ad_ad_type in ('APP_AD', 'APP_ENGAGEMENT_AD') and g.partition_time in (
            select  max(partition_time) from `google_ads_data.disapprovals_ad_group_ad` group by date(partition_time)
            )
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: ad_group_ad_ad_id {
    type: number
    sql: ${TABLE}.ad_group_ad_ad_id ;;
  }

  dimension: adgroup_approval_status {
    type: string
    sql: ${TABLE}.adgroup_approval_status ;;
  }

  dimension: adgroup_review_status {
    type: string
    sql: ${TABLE}.adgroup_review_status ;;
  }

  dimension: ad_group_ad_ad_type {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_type ;;
  }

  dimension_group: partition_time {
    type: time
    sql: ${TABLE}.partition_time ;;
  }

  dimension: asset_approval_status {
    type: string
    sql: ${TABLE}.asset_approval_status ;;
  }

  dimension: asset_review_status {
    type: string
    sql: ${TABLE}.asset_review_status ;;
  }

  dimension: ad_group_ad_asset_view_field_type {
    type: string
    sql: ${TABLE}.ad_group_ad_asset_view_field_type ;;
  }

  dimension: asset_id {
    type: number
    sql: ${TABLE}.asset_id ;;
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }

  set: detail {
    fields: [
      campaign_id,
      ad_group_id,
      customer_id,
      ad_group_ad_ad_id,
      adgroup_approval_status,
      adgroup_review_status,
      ad_group_ad_ad_type,
      partition_time_time,
      asset_approval_status,
      asset_review_status,
      ad_group_ad_asset_view_field_type,
      asset_id,
      asset_type
    ]
  }
}
