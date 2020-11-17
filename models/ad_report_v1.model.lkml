connection: "ad_report"

# include all the views
include: "/views/**/*.view"

datagroup: ad_report_v1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ad_report_v1_default_datagroup

explore: campaign_conv_blend {
  view_name: campaigns
  join: campaign_conversion_report {
      type: left_outer
      sql_on: ${campaigns.campaign_id}=${campaign_conversion_report.campaign_id} and ${campaigns.segments_date}=${campaign_conversion_report.segments_date};;
      relationship: one_to_many
    }
  }

explore: asset_performance_report {}

explore: campaign_conversion_report {}

explore: campaign_network_report {}

explore: campaigns {}

explore: disapproval_report_all {}

explore: disapproval_report_latest {}

explore: geo_conversion_report {}

explore: geo_report_summary {}

explore: placement_conversion_report {}

explore: placement_report_agg {}

explore: placement_report_list {}

explore: language_constant {}
