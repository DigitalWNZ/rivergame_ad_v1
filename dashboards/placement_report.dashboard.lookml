- dashboard: placement_report
  title: placement_report
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: Clicks_vs_CTR
    title: Clicks_vs_CTR
    model: ad_report_v1
    explore: placement_report_agg
    type: looker_line
    fields: [placement_report_agg.sum_clicks, placement_report_agg.ctr, placement_report_agg.segments_date]
    fill_fields: [placement_report_agg.segments_date]
    sorts: [placement_report_agg.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: placement_report_agg.sum_clicks,
            id: placement_report_agg.sum_clicks, name: Clicks}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: placement_report_agg.ctr,
            id: placement_report_agg.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      App: placement_report_agg.app_id
      Date: placement_report_agg.segments_date
      Campaign Name: placement_report_agg.campaign_name
      Campaign ID: placement_report_agg.campaign_id
      Campaign Status: placement_report_agg.campaign_status
      Placement Type: placement_report_agg.placement_type_display
    row: 13
    col: 0
    width: 8
    height: 6
  - name: conversion_vs_CVR
    title: conversion_vs_CVR
    model: ad_report_v1
    explore: placement_report_agg
    type: looker_line
    fields: [placement_report_agg.segments_date, placement_report_agg.sum_conversions,
      placement_report_agg.cvr]
    fill_fields: [placement_report_agg.segments_date]
    sorts: [placement_report_agg.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: placement_report_agg.sum_conversions,
            id: placement_report_agg.sum_conversions, name: Conversions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: placement_report_agg.cvr,
            id: placement_report_agg.cvr, name: CVR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      App: placement_report_agg.app_id
      Date: placement_report_agg.segments_date
      Campaign Name: placement_report_agg.campaign_name
      Campaign ID: placement_report_agg.campaign_id
      Campaign Status: placement_report_agg.campaign_status
      Placement Type: placement_report_agg.placement_type_display
    row: 13
    col: 8
    width: 8
    height: 6
  - name: cost_vs_avg_cpc
    title: cost_vs_avg_cpc
    model: ad_report_v1
    explore: placement_report_agg
    type: looker_line
    fields: [placement_report_agg.segments_date, placement_report_agg.sum_cost, placement_report_agg.avg_cpc]
    fill_fields: [placement_report_agg.segments_date]
    sorts: [placement_report_agg.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: placement_report_agg.sum_cost,
            id: placement_report_agg.sum_cost, name: Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: right,
        series: [{axisId: placement_report_agg.avg_cpc, id: placement_report_agg.avg_cpc,
            name: Avg.CPC}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      App: placement_report_agg.app_id
      Date: placement_report_agg.segments_date
      Campaign Name: placement_report_agg.campaign_name
      Campaign ID: placement_report_agg.campaign_id
      Campaign Status: placement_report_agg.campaign_status
      Placement Type: placement_report_agg.placement_type_display
    row: 13
    col: 16
    width: 8
    height: 6
  - name: ctr_cvr_by_placement_type
    title: ctr_cvr_by_placement_type
    model: ad_report_v1
    explore: placement_report_agg
    type: looker_column
    fields: [placement_report_agg.ctr, placement_report_agg.cvr, placement_report_agg.placement_type_display]
    sorts: [placement_report_agg.ctr desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      App: placement_report_agg.app_id
      Date: placement_report_agg.segments_date
      Campaign Name: placement_report_agg.campaign_name
      Campaign ID: placement_report_agg.campaign_id
      Campaign Status: placement_report_agg.campaign_status
      Placement Type: placement_report_agg.placement_type_display
    row: 4
    col: 12
    width: 12
    height: 7
  - name: table_detail
    title: table_detail
    model: ad_report_v1
    explore: placement_report_list
    type: looker_grid
    fields: [placement_report_list.placement_type_display, placement_report_list.group_placement_view_display_name,
      placement_report_list.sum_cost, placement_report_list.sum_impressions, placement_report_list.sum_clicks,
      placement_report_list.ctr, placement_report_list.cvr, placement_report_list.sum_conversions,
      placement_report_list.sum_conversions_value, placement_report_list.roas]
    sorts: [placement_report_list.sum_cost desc]
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
      placement_report_list.sum_cost:
        is_active: true
      placement_report_list.sum_impressions:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_report_list.sum_clicks:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_report_list.ctr:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_report_list.cvr:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_report_list.sum_conversions:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_report_list.sum_conversions_value:
        is_active: true
        palette:
          palette_id: 1ebd8493-ebcc-4e57-a4ff-ab3e6111da24
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_report_list.roas:
        is_active: false
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      App: placement_report_list.app_id
      Date: placement_report_list.segments_date
      Campaign Name: placement_report_list.campaign_name
      Campaign ID: placement_report_list.campaign_id
      Campaign Status: placement_report_list.campaign_status
      Placement: placement_report_list.group_placement_view_display_name
      Placement Type: placement_report_list.placement_type_display
    row: 21
    col: 0
    width: 24
    height: 7
  - name: cost_by_placement_type
    title: cost_by_placement_type
    model: ad_report_v1
    explore: placement_report_agg
    type: looker_pie
    fields: [placement_report_agg.placement_type_display, placement_report_agg.sum_cost]
    sorts: [placement_report_agg.sum_cost desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen:
      App: placement_report_agg.app_id
      Date: placement_report_agg.segments_date
      Campaign Name: placement_report_agg.campaign_name
      Campaign ID: placement_report_agg.campaign_id
      Campaign Status: placement_report_agg.campaign_status
      Placement Type: placement_report_agg.placement_type_display
    row: 4
    col: 0
    width: 12
    height: 7
  - name: table_detail_2
    title: table_detail_2
    model: ad_report_v1
    explore: placement_conversion_report
    type: looker_grid
    fields: [placement_conversion_report.segments_conversion_action_name, placement_conversion_report.sum_conversions,
      placement_conversion_report.sum_conversion_value, placement_conversion_report.sum_all_conversions,
      placement_conversion_report.sum_all_conversion_value]
    sorts: [placement_conversion_report.sum_conversions desc]
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
      placement_conversion_report.sum_conversions:
        is_active: true
      placement_conversion_report.sum_conversion_value:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_conversion_report.sum_all_conversions:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      placement_conversion_report.sum_all_conversion_value:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Date: placement_conversion_report.segments_date
      Campaign ID: placement_conversion_report.campaign_id
    row: 30
    col: 0
    width: 24
    height: 4
  - name: "<b>Cost by Placement Type</b>"
    type: text
    title_text: "<b>Cost by Placement Type</b>"
    row: 2
    col: 0
    width: 12
    height: 2
  - name: "<b>CTR&CVR by Placement Type</b>"
    type: text
    title_text: "<b>CTR&CVR by Placement Type</b>"
    row: 2
    col: 12
    width: 12
    height: 2
  - name: "<b>Clicks & CTR</b>"
    type: text
    title_text: "<b>Clicks & CTR</b>"
    row: 11
    col: 0
    width: 8
    height: 2
  - name: "<b>Conversions & CVR</b>"
    type: text
    title_text: "<b>Conversions & CVR</b>"
    row: 11
    col: 8
    width: 8
    height: 2
  - name: "<b>Cost & AvgCPC</b>"
    type: text
    title_text: "<b>Cost & Avg.CPC</b>"
    row: 11
    col: 16
    width: 8
    height: 2
  - name: "<b>Placement Performance Report</b>"
    type: text
    title_text: "<b>Placement Performance Report</b>"
    subtitle_text: "<i>Order by cost</i>"
    row: 19
    col: 0
    width: 24
    height: 2
  - name: "<b>Conversions Breakdown</b>"
    type: text
    title_text: "<b>Conversions Breakdown</b>"
    row: 28
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
  - name: App
    title: App
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_agg
    listens_to_filters: []
    field: placement_report_agg.app_id
  - name: Date
    title: Date
    type: field_filter
    default_value: 2020/11/08 to 2020/11/15
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_agg
    listens_to_filters: []
    field: placement_report_agg.segments_date
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_agg
    listens_to_filters: []
    field: placement_report_agg.campaign_name
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_agg
    listens_to_filters: []
    field: placement_report_agg.campaign_id
  - name: Campaign Status
    title: Campaign Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_agg
    listens_to_filters: []
    field: placement_report_agg.campaign_status
  - name: Placement
    title: Placement
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_list
    listens_to_filters: []
    field: placement_report_list.group_placement_view_display_name
  - name: Placement Type
    title: Placement Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: placement_report_agg
    listens_to_filters: []
    field: placement_report_agg.placement_type_display
