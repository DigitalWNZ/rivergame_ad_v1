- dashboard: geo_performance
  title: geo_performance
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: clicks_by_network
    title: clicks_by_network
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.segments_ad_network_type, geo_report_summary.sum_clicks]
    sorts: [geo_report_summary.sum_clicks desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 20
    col: 0
    width: 4
    height: 5
  - name: clicks_by_platform
    title: clicks_by_platform
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.platform, geo_report_summary.sum_clicks]
    sorts: [geo_report_summary.sum_clicks desc]
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
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 20
    col: 12
    width: 4
    height: 5
  - name: Clicks_vs_CTR
    title: Clicks_vs_CTR
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_line
    fields: [geo_report_summary.segments_date, geo_report_summary.sum_clicks, geo_report_summary.ctr]
    fill_fields: [geo_report_summary.segments_date]
    sorts: [geo_report_summary.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: geo_report_summary.sum_clicks,
            id: geo_report_summary.sum_clicks, name: Clicks}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: geo_report_summary.ctr,
            id: geo_report_summary.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 12
    col: 0
    width: 8
    height: 6
  - name: conversion_by_network
    title: conversion_by_network
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.segments_ad_network_type, geo_report_summary.sum_conversions]
    sorts: [geo_report_summary.sum_conversions desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 20
    col: 8
    width: 4
    height: 5
  - name: conversion_by_platform
    title: conversion_by_platform
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.sum_conversions, geo_report_summary.platform]
    sorts: [geo_report_summary.sum_conversions desc]
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
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 20
    col: 20
    width: 4
    height: 5
  - name: conversion_vs_CVR
    title: conversion_vs_CVR
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_line
    fields: [geo_report_summary.segments_date, geo_report_summary.sum_conversions,
      geo_report_summary.cvr]
    fill_fields: [geo_report_summary.segments_date]
    sorts: [geo_report_summary.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: geo_report_summary.sum_conversions,
            id: geo_report_summary.sum_conversions, name: Conversions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: geo_report_summary.cvr, id: geo_report_summary.cvr,
            name: CVR}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 12
    col: 8
    width: 8
    height: 6
  - name: cost_by_country
    title: cost_by_country
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.geo_target_constant_canonical_name, geo_report_summary.sum_cost]
    sorts: [geo_report_summary.sum_cost desc]
    limit: 10
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 4
    col: 0
    width: 12
    height: 6
  - name: cost_vs_avg_cpc
    title: cost_vs_avg_cpc
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_line
    fields: [geo_report_summary.segments_date, geo_report_summary.sum_cost, geo_report_summary.avg_cpc]
    fill_fields: [geo_report_summary.segments_date]
    sorts: [geo_report_summary.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: geo_report_summary.sum_cost,
            id: geo_report_summary.sum_cost, name: Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: right,
        series: [{axisId: geo_report_summary.avg_cpc, id: geo_report_summary.avg_cpc,
            name: Avg.CPC}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 12
    col: 16
    width: 8
    height: 6
  - name: detail_table_2
    title: detail_table_2
    model: ad_report_v1
    explore: geo_conversion_report
    type: looker_grid
    fields: [geo_conversion_report.segments_conversion_action_name, geo_conversion_report.sum_conversions,
      geo_conversion_report.sum_conversion_value, geo_conversion_report.sum_all_conversions,
      geo_conversion_report.sum_all_conversion_value]
    sorts: [geo_conversion_report.sum_conversions desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      geo_conversion_report.sum_conversions:
        is_active: true
      geo_conversion_report.sum_conversion_value:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_conversion_report.sum_all_conversions:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_conversion_report.sum_all_conversion_value:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
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
    title_hidden: true
    listen: {}
    row: 37
    col: 0
    width: 24
    height: 5
  - name: cost_by_network
    title: cost_by_network
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.segments_ad_network_type, geo_report_summary.sum_cost]
    sorts: [geo_report_summary.sum_cost desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 20
    col: 4
    width: 4
    height: 5
  - name: cost_by_platform
    title: cost_by_platform
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_pie
    fields: [geo_report_summary.platform, geo_report_summary.sum_cost]
    sorts: [geo_report_summary.sum_cost desc]
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
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 20
    col: 16
    width: 4
    height: 5
  - name: roas
    title: roas
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_bar
    fields: [geo_report_summary.geo_target_constant_canonical_name, geo_report_summary.roas]
    sorts: [geo_report_summary.roas desc]
    limit: 5
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
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 4
    col: 12
    width: 12
    height: 6
  - name: table_detail
    title: table_detail
    model: ad_report_v1
    explore: geo_report_summary
    type: looker_grid
    fields: [geo_report_summary.geo_target_constant_canonical_name, geo_report_summary.sum_impressions,
      geo_report_summary.sum_clicks, geo_report_summary.sum_cost, geo_report_summary.sum_conversions_value,
      geo_report_summary.ctr, geo_report_summary.cvr, geo_report_summary.roas]
    sorts: [geo_report_summary.sum_cost desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      geo_report_summary.sum_impressions:
        is_active: true
      geo_report_summary.sum_clicks:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_report_summary.sum_cost:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_report_summary.sum_conversions_value:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_report_summary.ctr:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_report_summary.cvr:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      geo_report_summary.roas:
        is_active: true
        palette:
          palette_id: 1ebd8493-ebcc-4e57-a4ff-ab3e6111da24
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: geo_report_summary.customer_id
      App: geo_report_summary.campaign_app_campaign_setting_app_id
      Date: geo_report_summary.segments_date
      Campaign Name: geo_report_summary.campaign_name
      Campaign ID: geo_report_summary.campaign_id
      Campaign Status: geo_report_summary.campaign_status
      Network: geo_report_summary.segments_ad_network_type
      Target Country: geo_report_summary.geo_target_constant_canonical_name
    row: 27
    col: 0
    width: 24
    height: 8
  - name: "<b>Cost by Countries</b>"
    type: text
    title_text: "<b>Cost by Countries</b>"
    row: 2
    col: 0
    width: 12
    height: 2
  - name: "<b>ROAS by Countries - Top #5</b>"
    type: text
    title_text: "<b>ROAS by Countries - Top #5</b>"
    row: 2
    col: 12
    width: 12
    height: 2
  - name: "<b>Clicks & CTR</b>"
    type: text
    title_text: "<b>Clicks & CTR</b>"
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
  - name: "<b>Geo Performance Report</b>"
    type: text
    title_text: "<b>Geo Performance Report</b>"
    subtitle_text: by CTR, AVg.CPC, and Cost/Conversions
    row: 25
    col: 0
    width: 24
    height: 2
  - name: "<b>Conversions Breakdown</b>"
    type: text
    title_text: "<b>Conversions Breakdown</b>"
    row: 35
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
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.customer_id
  - name: App
    title: App
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.campaign_app_campaign_setting_app_id
  - name: Date
    title: Date
    type: field_filter
    default_value: 2020/11/08 to 2020/11/15
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.segments_date
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.campaign_name
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.campaign_id
  - name: Campaign Status
    title: Campaign Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.campaign_status
  - name: Network
    title: Network
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.segments_ad_network_type
  - name: Target Country
    title: Target Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: geo_report_summary
    listens_to_filters: []
    field: geo_report_summary.geo_target_constant_canonical_name
