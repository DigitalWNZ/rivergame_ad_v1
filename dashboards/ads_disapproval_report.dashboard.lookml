- dashboard: ads_disapproval_report
  title: Ads_Disapproval_Report
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: ad_group_approval
    title: ad_group_approval
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_pie
    fields: [disapproval_report_latest.count, disapproval_report_latest.adgroup_approval_status]
    sorts: [disapproval_report_latest.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 12
    col: 12
    width: 12
    height: 6
  - name: asset_review
    title: asset_review
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_pie
    fields: [disapproval_report_latest.asset_review_status, disapproval_report_latest.count]
    sorts: [disapproval_report_latest.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 4
    col: 0
    width: 12
    height: 6
  - name: approval_by_type
    title: approval_by_type
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_donut_multiples
    fields: [disapproval_report_latest.asset_approval_status, disapproval_report_latest.count,
      disapproval_report_latest.asset_type]
    pivots: [disapproval_report_latest.asset_approval_status]
    sorts: [disapproval_report_latest.count desc 0, disapproval_report_latest.asset_type,
      disapproval_report_latest.asset_approval_status]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 28
    col: 0
    width: 24
    height: 6
  - name: asset_approval_trend
    title: asset_approval_trend
    model: ad_report_v1
    explore: disapproval_report_all
    type: looker_line
    fields: [disapproval_report_all.partition_time_date, disapproval_report_all.asset_approval_status,
      disapproval_report_all.count]
    pivots: [disapproval_report_all.asset_approval_status]
    fill_fields: [disapproval_report_all.partition_time_date]
    sorts: [disapproval_report_all.partition_time_date desc, disapproval_report_all.asset_approval_status]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_all.customer_id
      Campaign ID: disapproval_report_all.campaign_id
      Ad Group Review Status: disapproval_report_all.adgroup_review_status
      Ad Group Approval Status: disapproval_report_all.adgroup_approval_status
      Asset Review Status: disapproval_report_all.asset_review_status
      Asset Approval Status: disapproval_report_all.asset_approval_status
    row: 20
    col: 0
    width: 12
    height: 6
  - name: ad_group_review
    title: ad_group_review
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_pie
    fields: [disapproval_report_latest.count, disapproval_report_latest.adgroup_review_status]
    sorts: [disapproval_report_latest.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 12
    col: 0
    width: 12
    height: 6
  - name: asset_approval
    title: asset_approval
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_pie
    fields: [disapproval_report_latest.count, disapproval_report_latest.asset_approval_status]
    sorts: [disapproval_report_latest.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 4
    col: 12
    width: 12
    height: 6
  - name: top_reasons
    title: top_reasons
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_bar
    fields: [disapproval_report_latest.topic, disapproval_report_latest.count]
    sorts: [disapproval_report_latest.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 20
    col: 12
    width: 12
    height: 6
  - name: table_detail
    title: table_detail
    model: ad_report_v1
    explore: disapproval_report_latest
    type: looker_grid
    fields: [disapproval_report_latest.customer_descriptive_name, disapproval_report_latest.campaign_id,
      disapproval_report_latest.ad_group_name, disapproval_report_latest.adgroup_review_status,
      disapproval_report_latest.adgroup_approval_status, disapproval_report_latest.type,
      disapproval_report_latest.topic, disapproval_report_latest.asset_id, disapproval_report_latest.asset_type,
      disapproval_report_latest.asset_review_status, disapproval_report_latest.asset_approval_status,
      disapproval_report_latest.sum_asset_approval_ind]
    sorts: [disapproval_report_latest.asset_approval_status desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen:
      Customer: disapproval_report_latest.customer_id
      Campaign ID: disapproval_report_latest.campaign_id
      Campaign Status: disapproval_report_latest.campaign_status
      Ad Group Review Status: disapproval_report_latest.adgroup_review_status
      Ad Group Approval Status: disapproval_report_latest.adgroup_approval_status
      Asset Review Status: disapproval_report_latest.asset_review_status
      Asset Approval Status: disapproval_report_latest.asset_approval_status
    row: 36
    col: 0
    width: 24
    height: 8
  - name: "<b>Assets Reviews</b>"
    type: text
    title_text: "<b>Assets Reviews</b>"
    row: 2
    col: 0
    width: 12
    height: 2
  - name: "<b>AdGroup Reviews</b>"
    type: text
    title_text: "<b>AdGroup Reviews</b>"
    row: 10
    col: 0
    width: 12
    height: 2
  - name: "<b>Assets Disapprovals</b>"
    type: text
    title_text: "<b>Assets Disapprovals</b>"
    row: 2
    col: 12
    width: 12
    height: 2
  - name: "<b>AdGroup Disapprovals</b>"
    type: text
    title_text: "<b>AdGroup Disapprovals</b>"
    row: 10
    col: 12
    width: 12
    height: 2
  - name: "<b>Assets Approved Trends</b>"
    type: text
    title_text: "<b>Assets Approved Trends</b>"
    row: 18
    col: 0
    width: 12
    height: 2
  - name: "<b>Top Reasons of Ad Group Disapproval</b>"
    type: text
    title_text: "<b>Top Reasons of Ad Group Disapproval</b>"
    row: 18
    col: 12
    width: 12
    height: 2
  - name: "<b>Assets Disapproval by Type</b>"
    type: text
    title_text: "<b>Assets Disapproval by Type</b>"
    row: 26
    col: 0
    width: 24
    height: 2
  - name: "<b>Ads Disapproval Report</b>"
    type: text
    title_text: "<b>Ads Disapproval Report</b>"
    subtitle_text: "<i>Disapproval A​ppeal URL: https://support.google.com/google-ads/gethelp</i>"
    row: 34
    col: 0
    width: 24
    height: 2
  - title: New Tile
    name: New Tile
    model: ad_report_v1
    explore: language_constant
    type: single_value
    fields: [language_constant.dash_nav]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Customer
    title: Customer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.customer_id
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.campaign_id
  - name: Campaign Status
    title: Campaign Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.campaign_status
  - name: Ad Group Review Status
    title: Ad Group Review Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.adgroup_review_status
  - name: Ad Group Approval Status
    title: Ad Group Approval Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.adgroup_approval_status
  - name: Asset Review Status
    title: Asset Review Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.asset_review_status
  - name: Asset Approval Status
    title: Asset Approval Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: disapproval_report_latest
    listens_to_filters: []
    field: disapproval_report_latest.asset_approval_status
