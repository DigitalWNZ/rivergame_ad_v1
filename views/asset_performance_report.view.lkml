view: asset_performance_report {
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
        segments_ad_network_type,
        asset_youtube_video_asset_youtube_video_id,
        ad_group_ad_asset_view_field_type,
        ad_group_ad_asset_view_performance_label,
        asset_image_asset_full_size_width_pixels,
        asset_name,
        asset_id,
        v.video_title,
        asset_image_asset_full_size_height_pixels,
        asset_image_asset_full_size_url,
        metrics_clicks,
        metrics_conversions_value,
        metrics_impressions,
        CASE
          WHEN asset_type = "YOUTUBE_VIDEO" THEN CONCAT("https://www.youtube.com/watch?v=",asset_youtube_video_asset_youtube_video_id)
          WHEN asset_type = "IMAGE" THEN asset_image_asset_full_size_url
        ELSE null
        END as asset_link,
      CASE
          WHEN asset_type = "YOUTUBE_VIDEO" THEN CONCAT("https://i.ytimg.com/vi/",asset_youtube_video_asset_youtube_video_id,"/hqdefault.jpg")
          WHEN asset_type = "IMAGE" THEN asset_image_asset_full_size_url
        ELSE null
        END as asset_thumbnail,
        ROUND(network.metrics_cost_micros/1e6,2) metrics_cost,
        metrics_conversions,
        camp.customer_descriptive_name,
        camp.customer_currency_code,
        camp.customer_id,
        camp.campaign_app_campaign_setting_bidding_strategy_goal_type,
        camp.campaign_app_campaign_setting_app_store,
        camp.campaign_name,
        camp.campaign_status,
        camp.campaign_app_campaign_setting_app_id,
        asset_text_asset_text
      FROM
        google_ads_data.asset_performance_report network
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
      LEFT JOIN
        google_ads_data.videos v
      ON
        v.video_id = network.asset_youtube_video_asset_youtube_video_id
      WHERE
        network.partition_time IN (
        SELECT
          MAX(partition_time)
        FROM
          google_ads_data.asset_performance_report)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # start
  measure: assets {
    label: "Assets"
    type: count_distinct
    sql: ${asset_id} ;;
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
    type: sum
    sql: ${metrics_conversions_value} ;;
  }

  measure: sum_cost {
    label: "Cost"
    value_format: "$0.00"
    type: sum
    sql: ${metrics_cost} ;;
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

  dimension: asset_name_display {
    label: "Asset"
    type: string
    sql:
      case
        when ${asset_text_asset_text} != "" then ${asset_text_asset_text}
        when ${asset_type_display} = "Video" then ${video_title}
        else ${asset_name}
      end ;;
    link: {
      label: "View {{value}}"
      url: "{{asset_link._value}}"
    }
  }

  dimension: asset_type_display {
    label: "Asset Type"
    type: string
    sql:
    CASE
      WHEN ${ad_group_ad_asset_view_field_type} = "DESCRIPTION" THEN "Description"
      WHEN ${ad_group_ad_asset_view_field_type} = "HEADLINE" THEN "Headline"
      WHEN ${ad_group_ad_asset_view_field_type} = "YOUTUBE_VIDEO" THEN "Video"
      WHEN ${ad_group_ad_asset_view_field_type} = "MEDIA_BUNDLE" THEN "Media bundle asset"
      WHEN ${ad_group_ad_asset_view_field_type} = "MARKETING_IMAGE" THEN "Image"
      ELSE ""
    END;;
  }

  dimension: network_type_display {
    type: string
    sql:
      case
        when ${segments_ad_network_type} = "SEARCH" then "Search"
        when ${segments_ad_network_type} = "SEARCH_PARTNERS" then "Search Partners"
        when ${segments_ad_network_type} = "CONTENT" then "Content"
        when ${segments_ad_network_type} = "YOUTUBE_SEARCH" then "Youtube Search"
        when ${segments_ad_network_type} = "YOUTUBE_WATCH" then "Youtube Watch"
        when ${segments_ad_network_type} = "MIXED" then "Mixed"
        else ""
      end;;
  }

  dimension: platform {
    type: string
    sql:
      case
          when ${campaign_app_campaign_setting_app_store} = "APPLE_APP_STORE" then "iOS"
          when ${campaign_app_campaign_setting_app_store} = "GOOGLE_APP_STORE" then "Android"
          else ""
        end;;
  }

  dimension: Avg_cpc {
    type: number
    value_format_name: decimal_2
    sql: if (${metrics_clicks}=0,0,${metrics_cost}/${metrics_clicks}) ;;
  }

  measure: avg_cpc {
    label: "Avg.CPC"
    value_format_name: decimal_2
    type: sum
    sql: ${Avg_cpc} ;;
  }

  # dimension: asset_hyperlink {
  #   type: string
  #   sql: HYPERLINK(${asset_link},${asset_name_display}) ;;
  # }
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

  dimension: segments_ad_network_type {
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension: asset_youtube_video_asset_youtube_video_id {
    type: string
    sql: ${TABLE}.asset_youtube_video_asset_youtube_video_id ;;
  }

  dimension: ad_group_ad_asset_view_field_type {
    type: string
    sql: ${TABLE}.ad_group_ad_asset_view_field_type ;;
  }

  dimension: ad_group_ad_asset_view_performance_label {
    type: string
    sql: ${TABLE}.ad_group_ad_asset_view_performance_label ;;
  }

  dimension: asset_image_asset_full_size_width_pixels {
    type: number
    sql: ${TABLE}.asset_image_asset_full_size_width_pixels ;;
  }

  dimension: asset_name {
    type: string
    sql: ${TABLE}.asset_name ;;
  }

  dimension: asset_id {
    type: string
    sql: ${TABLE}.asset_id ;;
  }

  dimension: video_title {
    type: string
    sql: ${TABLE}.video_title ;;
  }

  dimension: asset_image_asset_full_size_height_pixels {
    type: number
    sql: ${TABLE}.asset_image_asset_full_size_height_pixels ;;
  }

  dimension: asset_image_asset_full_size_url {
    type: string
    sql: ${TABLE}.asset_image_asset_full_size_url ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: asset_link {
    type: string
    sql: ${TABLE}.asset_link ;;
  }

  dimension: asset_thumbnail {
    label: "thumbnail"
    type: string
    sql: ${TABLE}.asset_thumbnail ;;
    html: <img src={{value}} width="300" height="300">;;
  }

  dimension: metrics_cost {
    type: number
    sql: ${TABLE}.metrics_cost ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
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

  dimension: campaign_app_campaign_setting_bidding_strategy_goal_type {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_bidding_strategy_goal_type ;;
  }

  dimension: campaign_app_campaign_setting_app_store {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_app_store ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: campaign_app_campaign_setting_app_id {
    type: string
    sql: ${TABLE}.campaign_app_campaign_setting_app_id ;;
  }

  dimension: asset_text_asset_text {
    type: string
    sql: ${TABLE}.asset_text_asset_text ;;
  }

  set: detail {
    fields: [
      campaign_id,
      segments_date,
      segments_ad_network_type,
      asset_youtube_video_asset_youtube_video_id,
      ad_group_ad_asset_view_field_type,
      ad_group_ad_asset_view_performance_label,
      asset_image_asset_full_size_width_pixels,
      asset_name,
      asset_id,
      video_title,
      asset_image_asset_full_size_height_pixels,
      asset_image_asset_full_size_url,
      metrics_clicks,
      metrics_conversions_value,
      metrics_impressions,
      asset_link,
      asset_thumbnail,
      metrics_cost,
      metrics_conversions,
      customer_descriptive_name,
      customer_currency_code,
      customer_id,
      campaign_app_campaign_setting_bidding_strategy_goal_type,
      campaign_app_campaign_setting_app_store,
      campaign_name,
      campaign_status,
      campaign_app_campaign_setting_app_id,
      asset_text_asset_text
    ]
  }
}
