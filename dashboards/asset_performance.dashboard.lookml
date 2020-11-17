- dashboard: asset_performance
  title: Asset_performance
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: asset_count
    title: asset_count
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.assets, asset_performance_report.asset_type_display]
    sorts: [asset_performance_report.assets desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 4
    col: 0
    width: 12
    height: 6
  - name: conversion_by_network
    title: conversion_by_network
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.network_type_display, asset_performance_report.sum_conversions]
    sorts: [asset_performance_report.sum_conversions desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 20
    col: 8
    width: 4
    height: 5
  - name: conversion_vs_CVR
    title: conversion_vs_CVR
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_line
    fields: [asset_performance_report.segments_date, asset_performance_report.cvr,
      asset_performance_report.sum_conversions]
    fill_fields: [asset_performance_report.segments_date]
    sorts: [asset_performance_report.segments_date desc]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: asset_performance_report.sum_conversions,
            id: asset_performance_report.sum_conversions, name: Conversions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: asset_performance_report.cvr,
            id: asset_performance_report.cvr, name: CVR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 12
    col: 8
    width: 8
    height: 6
  - name: clicks_by_network
    title: clicks_by_network
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.network_type_display, asset_performance_report.sum_clicks]
    sorts: [asset_performance_report.sum_clicks desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 20
    col: 0
    width: 4
    height: 5
  - name: clicks_by_platform
    title: clicks_by_platform
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.platform, asset_performance_report.sum_clicks]
    sorts: [asset_performance_report.sum_clicks desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 20
    col: 12
    width: 4
    height: 5
  - name: conversion_by_platform
    title: conversion_by_platform
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.sum_conversions, asset_performance_report.platform]
    sorts: [asset_performance_report.sum_conversions desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 20
    col: 20
    width: 4
    height: 5
  - name: cost_by_network
    title: cost_by_network
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.network_type_display, asset_performance_report.sum_cost]
    sorts: [asset_performance_report.sum_cost desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 20
    col: 4
    width: 4
    height: 5
  - name: cost_by_platform
    title: cost_by_platform
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.platform, asset_performance_report.sum_cost]
    sorts: [asset_performance_report.sum_cost desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 20
    col: 16
    width: 4
    height: 5
  - name: impressions_by_asset_type
    title: impressions_by_asset_type
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_pie
    fields: [asset_performance_report.asset_type_display, asset_performance_report.sum_impressions]
    sorts: [asset_performance_report.sum_impressions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 4
    col: 12
    width: 12
    height: 6
  - name: table_detail
    title: table_detail
    model: ad_report_v1
    explore: asset_performance_report
    type: table
    fields: [asset_performance_report.asset_thumbnail, asset_performance_report.asset_name_display,
      asset_performance_report.asset_id, asset_performance_report.asset_type_display,
      asset_performance_report.sum_impressions, asset_performance_report.sum_clicks,
      asset_performance_report.ctr, asset_performance_report.sum_cost, asset_performance_report.roas]
    sorts: [asset_performance_report.sum_impressions desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      asset_performance_report.asset_thumbnail: 518
      asset_performance_report.asset_name_display: 266
      asset_performance_report.asset_id: 113
      asset_performance_report.asset_type_display: 119
      asset_performance_report.sum_impressions: 152
      asset_performance_report.sum_clicks: 99
      asset_performance_report.ctr: 78
      asset_performance_report.sum_cost: 163
      asset_performance_report.roas: 88
    series_cell_visualizations:
      asset_performance_report.sum_impressions:
        is_active: true
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 27
    col: 0
    width: 24
    height: 11
  - name: cost_vs_avg_cpc
    title: cost_vs_avg_cpc
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_line
    fields: [asset_performance_report.segments_date, asset_performance_report.sum_cost,
      asset_performance_report.avg_cpc]
    fill_fields: [asset_performance_report.segments_date]
    sorts: [asset_performance_report.segments_date desc]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: asset_performance_report.sum_cost,
            id: asset_performance_report.sum_cost, name: Cost}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: asset_performance_report.avg_cpc,
            id: asset_performance_report.avg_cpc, name: Avg.CPC}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 12
    col: 16
    width: 8
    height: 6
  - name: impression_vs_CTR
    title: impression_vs_CTR
    model: ad_report_v1
    explore: asset_performance_report
    type: looker_line
    fields: [asset_performance_report.segments_date, asset_performance_report.sum_impressions,
      asset_performance_report.ctr]
    fill_fields: [asset_performance_report.segments_date]
    sorts: [asset_performance_report.segments_date desc]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: asset_performance_report.sum_impressions,
            id: asset_performance_report.sum_impressions, name: Impressions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: asset_performance_report.ctr,
            id: asset_performance_report.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: asset_performance_report.customer_id
      App: asset_performance_report.campaign_app_campaign_setting_app_id
      Date: asset_performance_report.segments_date
      Campaign Name: asset_performance_report.campaign_name
      Campaign ID: asset_performance_report.campaign_id
      Network Type: asset_performance_report.network_type_display
      Asset Type: asset_performance_report.asset_type_display
      Performance Group: asset_performance_report.ad_group_ad_asset_view_performance_label
    row: 12
    col: 0
    width: 8
    height: 6
  - name: "<b>Asset Count</b>"
    type: text
    title_text: "<b>Asset Count</b>"
    row: 2
    col: 0
    width: 12
    height: 2
  - name: "<b>Impressions</b>"
    type: text
    title_text: "<b>Impressions</b>"
    row: 2
    col: 12
    width: 12
    height: 2
  - name: "<b>Impressions & CTR</b>"
    type: text
    title_text: "<b>Impressions & CTR</b>"
    row: 10
    col: 0
    width: 8
    height: 2
  - name: "<b>Conversions & CVR</b>"
    type: text
    title_text: "<b>Conversions & CVR</b>"
    row: 10
    col: 8
    width: 8
    height: 2
  - name: "<b>Cost & AvgCPC</b>"
    type: text
    title_text: "<b>Cost & Avg.CPC</b>"
    row: 10
    col: 16
    width: 8
    height: 2
  - name: "<b>Network Breakdown</b>"
    type: text
    title_text: "<b>Network Breakdown</b>"
    subtitle_text: by Clicks,Cost and Conversions
    row: 18
    col: 0
    width: 12
    height: 2
  - name: "<b>Platform Breakdown</b>"
    type: text
    title_text: "<b>Platform Breakdown</b>"
    subtitle_text: by Clicks,Cost and Conversions
    row: 18
    col: 12
    width: 12
    height: 2
  - name: "<b>Assets Performance Report</b>"
    type: text
    title_text: "<b>Assets Performance Report</b>"
    subtitle_text: by CTR, AVg.CPC, and Cost/Conversions
    row: 25
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
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.customer_id
  - name: App
    title: App
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.campaign_app_campaign_setting_app_id
  - name: Date
    title: Date
    type: field_filter
    default_value: 2020/11/07 to 2020/11/14
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.segments_date
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.campaign_name
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.campaign_id
  - name: Network Type
    title: Network Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.network_type_display
  - name: Asset Type
    title: Asset Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.asset_type_display
  - name: Performance Group
    title: Performance Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: asset_performance_report
    listens_to_filters: []
    field: asset_performance_report.ad_group_ad_asset_view_performance_label
