view: disapproval_report_latest {
  derived_table: {
    sql: SELECT
        DISTINCT g.campaign_id,
        g.ad_group_id,
        g.customer_id,
        g.ad_group_ad_ad_id,
        camp.campaign_status,
        g.type,
        g.topic,
        CASE
          WHEN g.approvalStatus IS NULL THEN ' - '
            ELSE
            g.approvalStatus
        END AS adgroup_approval_status,
        g.reviewStatus adgroup_review_status,
        g.ad_group_name,
        camp.customer_descriptive_name,
        CASE
          WHEN s.ad_group_ad_asset_view_policy_summary.approvalStatus IS NULL THEN ' - '
        ELSE
        s.ad_group_ad_asset_view_policy_summary.approvalStatus
      END
        asset_approval_status,
        s.ad_group_ad_asset_view_policy_summary.reviewStatus asset_review_status,
        s.ad_group_ad_asset_view_field_type,
        s.asset_id,
        s.asset_type,
        s.asset_name
      FROM
        ( select distinct v.type, v.topic, campaign_id,ad_group_id, customer_id, ad_group_ad_ad_id, ad_group_ad_policy_summary.reviewStatus, ad_group_ad_policy_summary.approvalStatus, ad_group_name  FROM `google_ads_data.disapprovals_ad_group_ad` LEFT JOIN
        UNNEST(ad_group_ad_policy_summary.policyTopicEntries ) AS v where ad_group_ad_ad_type IN ('APP_AD',
          'APP_ENGAGEMENT_AD')
        AND partition_time IN (
        SELECT
          MAX(partition_time) partition_time
        FROM
          `google_ads_data.disapprovals_ad_group_ad` ) ) g
      LEFT JOIN
        `google_ads_data.disapprovals_ad_group_ad_asset_view` s
      ON s.ad_group_ad_ad_id=g.ad_group_ad_ad_id
      LEFT JOIN
        `google_ads_data.campaigns` camp
      ON
        camp.campaign_id = CAST(g.campaign_id AS string)
      WHERE
        camp.partition_time IN (
        SELECT
          MAX(partition_time)
        FROM
          `google_ads_data.campaigns` )
        AND camp.segments_date IN (
        SELECT
          MAX(segments_date)
        FROM
          `google_ads_data.campaigns`)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # Customization code start
  measure: distinct_ad_group_id {
    type: count_distinct
    sql: ${ad_group_id} ;;
  }

  # dimension: adgroup_link {
  #   type: string
  #   sql: HYPERLINK(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT("https://ads.google.com/aw/adassets?campaignId=", ${campaign_id}) , "&adGroupId="), ${ad_group_id}), "&ocid="), ${customer_id} ), ${ad_group_name}) ;;
  # }
  # dimension: campaign_link {
  #   type: string
  #   sql: HYPERLINK(concat(concat(CONCAT("https://ads.google.com/aw/overview?campaignId=",${campaign_id}), "&ocid="), ${customer_id}), ${campaign_id}) ;;
  # }

  dimension: final_approval_status {
    type: string
    sql: case
          when ${adgroup_approval_status} = "APPROVED" and ${asset_approval_status} = "APPROVED" then "APPROVED"
          else "ISSUE"
        end ;;
  }

  dimension: asset_approval_ind {
    type: number
    sql:
      case
        when ${asset_approval_status}="APPROVED" then 0
        else 1
      end;;
  }

  measure: sum_asset_approval_ind {
    label: "Approval Ind"
    type: sum
    sql: ${asset_approval_ind} ;;
  }
  # Customization code end


  dimension: campaign_id {
    label: "Campaign"
    type: number
    sql: ${TABLE}.campaign_id ;;
    link:{
      label: "View Campaign {{value}} on google ads"
      url: "https://ads.google.com/aw/overview?campaignId={{value}}&ocid={{customer_id._value}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
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

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: type {
    label: "Policy Type"
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: topic {
    label: "Policy Topic"
    type: string
    sql: ${TABLE}.topic ;;
  }

  dimension: adgroup_approval_status {
    label: "AG Approval"
    type: string
    sql: ${TABLE}.adgroup_approval_status ;;
  }

  dimension: adgroup_review_status {
    label: "AG Review"
    type: string
    sql: ${TABLE}.adgroup_review_status ;;
  }

  dimension: ad_group_name {
    label: "AdGroup"
    type: string
    sql: ${TABLE}.ad_group_name ;;
    link: {
      label: "view ad group {{value}}"
      url: "https://ads.google.com/aw/adassets?campaignId={campaign_id._value}}&adGroupId={{ad_group_id._value}}&ocid={{customer_id._value}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: customer_descriptive_name {
    label: "Account"
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: asset_approval_status {
    label: "Asset Approval"
    type: string
    sql: ${TABLE}.asset_approval_status ;;
  }



  dimension: asset_review_status {
    label: "Asset Review"
    type: string
    sql: ${TABLE}.asset_review_status ;;
  }

  dimension: ad_group_ad_asset_view_field_type {
    type: string
    sql: ${TABLE}.ad_group_ad_asset_view_field_type ;;
  }

  dimension: asset_id {
    label: "Asset ID"
    type: number
    sql: ${TABLE}.asset_id ;;
  }

  dimension: asset_type {
    label: "Asset Type"
    type: string
    sql: ${TABLE}.asset_type ;;
  }

  dimension: asset_name {
    type: string
    sql: ${TABLE}.asset_name ;;
  }

  set: detail {
    fields: [
      campaign_id,
      ad_group_id,
      customer_id,
      ad_group_ad_ad_id,
      campaign_status,
      type,
      topic,
      adgroup_approval_status,
      adgroup_review_status,
      ad_group_name,
      customer_descriptive_name,
      asset_approval_status,
      asset_review_status,
      ad_group_ad_asset_view_field_type,
      asset_id,
      asset_type,
      asset_name
    ]
  }
}
