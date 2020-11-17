- dashboard: campaign_performance
  title: Campaign_Performance
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: budge_amount_by_period
    title: budge_amount_by_period
    model: ad_report_v1
    explore: campaigns
    type: single_value
    fields: [campaigns.period, campaigns.sum_camp_budget_amount]
    sorts: [campaigns.period]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${campaigns.sum_camp_budget_amount}\
          \ / offset(${campaigns.sum_camp_budget_amount}, 1) -1 ", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Budget
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
    listen:
      Customer: campaigns.customer_id
      App: campaigns.campaign_app_campaign_setting_app_id
      Campaign Name: campaigns.campaign_name
      Campaign ID: campaigns.campaign_id
      Campaign Status: campaigns.campaign_status
      Campaign Type: campaigns.camp_type
    row: 8
    col: 0
    width: 6
    height: 3
  - name: clicks_by_period
    title: clicks_by_period
    model: ad_report_v1
    explore: campaign_network_report
    type: single_value
    fields: [campaign_network_report.period, campaign_network_report.sum_clicks]
    sorts: [campaign_network_report.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${campaign_network_report.sum_clicks}\
          \ / offset(${campaign_network_report.sum_clicks}, 1) -1 ", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Clicks
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
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 2
    col: 0
    width: 6
    height: 3
  - name: clicks_by_network
    title: clicks_by_network
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.segments_ad_network_type, campaign_network_report.sum_clicks]
    sorts: [campaign_network_report.sum_clicks desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 21
    col: 0
    width: 4
    height: 4
  - name: clicks_vs_cvr
    title: clicks_vs_cvr
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_line
    fields: [campaign_network_report.segments_date, campaign_network_report.sum_clicks,
      campaign_network_report.cvr]
    fill_fields: [campaign_network_report.segments_date]
    sorts: [campaign_network_report.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_network_report.sum_clicks,
            id: campaign_network_report.sum_clicks, name: Clicks}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: campaign_network_report.cvr,
            id: campaign_network_report.cvr, name: CVR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 13
    col: 8
    width: 8
    height: 6
  - name: conversion_by_network
    title: conversion_by_network
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.segments_ad_network_type, campaign_network_report.sum_conversions]
    sorts: [campaign_network_report.sum_conversions desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 21
    col: 8
    width: 4
    height: 4
  - name: clicks_by_platform
    title: clicks_by_platform
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.platform, campaign_network_report.sum_clicks]
    sorts: [campaign_network_report.sum_clicks desc]
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
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 21
    col: 12
    width: 4
    height: 4
  - name: cost_by_date
    title: cost_by_date
    model: ad_report_v1
    explore: campaigns
    type: looker_line
    fields: [campaigns.segments_date, campaigns.cost_by_budget]
    fill_fields: [campaigns.segments_date]
    sorts: [campaigns.segments_date desc]
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
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaigns.customer_id
      App: campaigns.campaign_app_campaign_setting_app_id
      Date: campaigns.segments_date
      Campaign Name: campaigns.campaign_name
      Campaign ID: campaigns.campaign_id
      Campaign Status: campaigns.campaign_status
      Campaign Type: campaigns.camp_type
    row: 27
    col: 12
    width: 12
    height: 5
  - name: conversion_by_platform
    title: conversion_by_platform
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.sum_conversions, campaign_network_report.platform]
    sorts: [campaign_network_report.sum_conversions desc]
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
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 21
    col: 20
    width: 4
    height: 4
  - name: cost_by_period
    title: cost_by_period
    model: ad_report_v1
    explore: campaign_network_report
    type: single_value
    fields: [campaign_network_report.period, campaign_network_report.sum_cost]
    sorts: [campaign_network_report.period]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${campaign_network_report.sum_cost}\
          \ / offset(${campaign_network_report.sum_cost}, 1) -1 ", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Spend
    series_types: {}
    defaults_version: 1
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 5
    col: 0
    width: 6
    height: 3
  - name: cost_by_network
    title: cost_by_network
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.segments_ad_network_type, campaign_network_report.sum_cost]
    sorts: [campaign_network_report.sum_cost desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 21
    col: 4
    width: 4
    height: 4
  - name: cost_by_camp_type
    title: cost_by_camp_type
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.camp_type, campaign_network_report.sum_cost]
    filters: {}
    sorts: [campaign_network_report.sum_cost desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 4
    col: 12
    width: 12
    height: 7
  - name: cost_by_platform
    title: cost_by_platform
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_pie
    fields: [campaign_network_report.platform, campaign_network_report.sum_cost]
    sorts: [campaign_network_report.sum_cost desc]
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
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 21
    col: 16
    width: 4
    height: 4
  - name: detail_table_2
    title: detail_table_2
    model: ad_report_v1
    explore: campaign_conversion_report
    type: looker_grid
    fields: [campaign_conversion_report.segments_conversion_action_name, campaign_conversion_report.sum_conversion,
      campaign_conversion_report.sum_conversion_value, campaign_conversion_report.sum_all_conversion,
      campaign_conversion_report.sum_all_conversion_value]
    sorts: [campaign_conversion_report.sum_conversion desc]
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
      campaign_conversion_report.sum_conversion:
        is_active: true
      campaign_conversion_report.sum_conversion_value:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaign_conversion_report.sum_all_conversion:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaign_conversion_report.sum_all_conversion_value:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Campaign ID: campaign_conversion_report.campaign_id
      Included in ROAS: campaign_conversion_report.segments_conversion_action_name
    row: 45
    col: 0
    width: 24
    height: 8
  - name: impression_by_period
    title: impression_by_period
    model: ad_report_v1
    explore: campaign_network_report
    type: single_value
    fields: [campaign_network_report.period, campaign_network_report.sum_impressions]
    sorts: [campaign_network_report.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${campaign_network_report.sum_impressions}\
          \ / offset(${campaign_network_report.sum_impressions}, 1) -1 ", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Impressions
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
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 5
    col: 6
    width: 6
    height: 3
  - name: detail_table
    title: detail_table
    model: ad_report_v1
    explore: campaign_conv_blend
    type: looker_grid
    fields: [campaigns.campaign_id, campaigns.campaign_name, campaigns.camp_type,
      campaigns.budget_excellence_reason, campaigns.target, campaigns.sum_in_app_actions,
      campaigns.sum_installs, campaigns.sum_cost, campaigns.cpa, campaigns.cpi, campaigns.roas,
      campaigns.budget_utilization]
    sorts: [campaigns.sum_cost desc]
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
      campaigns.sum_in_app_actions:
        is_active: true
      campaigns.sum_installs:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaigns.sum_cost:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaigns.cpa:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaigns.cpi:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaigns.roas:
        is_active: true
        palette:
          palette_id: 1ebd8493-ebcc-4e57-a4ff-ab3e6111da24
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      campaigns.budget_utilization:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    hidden_fields: []
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaigns.customer_id
      App: campaigns.campaign_app_campaign_setting_app_id
      Campaign Name: campaigns.campaign_name
      Campaign ID: campaign_conversion_report.campaign_id
      Campaign Status: campaigns.campaign_status
      Campaign Type: campaigns.camp_type
      Included in ROAS: campaign_conversion_report.segments_conversion_action_name
    row: 34
    col: 0
    width: 24
    height: 9
  - name: cost_vs_avg_cpc
    title: cost_vs_avg_cpc
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_line
    fields: [campaign_network_report.segments_date, campaign_network_report.sum_cost,
      campaign_network_report.avg_cpc]
    fill_fields: [campaign_network_report.segments_date]
    sorts: [campaign_network_report.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_network_report.sum_cost,
            id: campaign_network_report.sum_cost, name: Cost}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: campaign_network_report.avg_cpc,
            id: campaign_network_report.avg_cpc, name: Avg.CPC}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 13
    col: 16
    width: 8
    height: 6
  - name: ctr_by_period
    title: ctr_by_period
    model: ad_report_v1
    explore: campaign_network_report
    type: single_value
    fields: [campaign_network_report.period, campaign_network_report.ctr]
    sorts: [campaign_network_report.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${campaign_network_report.ctr}\
          \ / offset(${campaign_network_report.ctr}, 1) -1 ", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: CTR
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
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 2
    col: 6
    width: 6
    height: 3
  - name: impressions_vs_ctr
    title: impressions_vs_ctr
    model: ad_report_v1
    explore: campaign_network_report
    type: looker_line
    fields: [campaign_network_report.segments_date, campaign_network_report.sum_impressions,
      campaign_network_report.ctr]
    fill_fields: [campaign_network_report.segments_date]
    sorts: [campaign_network_report.segments_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_network_report.sum_impressions,
            id: campaign_network_report.sum_impressions, name: Sum Impressions}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: campaign_network_report.ctr, id: campaign_network_report.ctr,
            name: CTR}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Date: campaign_network_report.segments_date
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 13
    col: 0
    width: 8
    height: 6
  - name: interaction_rate_by_period
    title: interaction_rate_by_period
    model: ad_report_v1
    explore: campaign_network_report
    type: single_value
    fields: [campaign_network_report.period, campaign_network_report.interaction_rate]
    sorts: [campaign_network_report.interaction_rate desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${campaign_network_report.interaction_rate}\
          \ / offset(${campaign_network_report.interaction_rate}, 1) -1 ", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Interaction Rate
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
    listen:
      Customer: campaign_network_report.customer_id
      App: campaign_network_report.campaign_app_campaign_setting_app_id
      Campaign Name: campaign_network_report.campaign_name
      Campaign ID: campaign_network_report.campaign_id
      Campaign Status: campaign_network_report.campaign_status
      Campaign Type: campaign_network_report.camp_type
      Network Type: campaign_network_report.segments_ad_network_type
    row: 8
    col: 6
    width: 6
    height: 3
  - name: spend_by_customer
    title: spend_by_customer
    model: ad_report_v1
    explore: campaigns
    type: looker_grid
    fields: [campaigns.customer_id, campaigns.sum_cost, campaigns.sum_camp_budget_amount,
      campaigns.budget_utilization]
    sorts: [campaigns.sum_cost desc]
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      campaigns.sum_cost:
        is_active: true
      campaigns.sum_camp_budget_amount:
        is_active: true
    conditional_formatting: [{type: less than, value: 0.8, background_color: "#d6151d",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: [campaigns.budget_utilization]}]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Customer: campaigns.customer_id
      App: campaigns.campaign_app_campaign_setting_app_id
      Date: campaigns.segments_date
      Campaign Name: campaigns.campaign_name
      Campaign ID: campaigns.campaign_id
      Campaign Status: campaigns.campaign_status
      Campaign Type: campaigns.camp_type
    row: 27
    col: 0
    width: 12
    height: 5
  - name: "<b>Cost by Campaign Type</b>"
    type: text
    title_text: "<b>Cost by Campaign Type</b>"
    row: 2
    col: 12
    width: 12
    height: 2
  - name: "<b>Impressions & CTR</b>"
    type: text
    title_text: "<b>Impressions & CTR</b>"
    row: 11
    col: 0
    width: 8
    height: 2
  - name: "<b>Clicks & CVR</b>"
    type: text
    title_text: "<b>Clicks & CVR</b>"
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
  - name: "<b>Network Breakdown</b>"
    type: text
    title_text: "<b>Network Breakdown</b>"
    subtitle_text: by Clicks,Cost and Conversions
    row: 19
    col: 0
    width: 12
    height: 2
  - name: "<b>Platform Breakdown</b>"
    type: text
    title_text: "<b>Platform Breakdown</b>"
    subtitle_text: by Clicks,Cost and Conversions
    row: 19
    col: 12
    width: 12
    height: 2
  - name: "<b>Account Spending Monitor</b>"
    type: text
    title_text: "<b>Account Spending Monitor</b>"
    subtitle_text: 'Note: Red flag if Budget Utilization < 80%'
    row: 25
    col: 0
    width: 12
    height: 2
  - name: "<b>spending Trends</b>"
    type: text
    title_text: "<b>spending Trends</b>"
    row: 25
    col: 12
    width: 12
    height: 2
  - name: "<b>Campaigns</b> <I> order by Cost</I>"
    type: text
    title_text: "<b>Campaigns</b> <I> order by Cost</I>"
    subtitle_text: "<I>Note:  Budget Excellence (BE) - A campaign must have a Target\
      \ CPA budget at least 10x their bid or a Target CPI budget at least 50x their\
      \ bid </I> <br><I>Budget Utilization  =  SUM(Cost)/SUM(Budget) %</I>"
    row: 32
    col: 0
    width: 24
    height: 2
  - name: "<b>Conversion Breakdown</b>"
    type: text
    title_text: "<b>Conversion Breakdown</b>"
    row: 43
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
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.customer_id
  - name: App
    title: App
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.campaign_app_campaign_setting_app_id
  - name: Date
    title: Date
    type: field_filter
    default_value: 2020/11/07 to 2020/11/13
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.segments_date
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.campaign_name
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.campaign_id
  - name: Campaign Status
    title: Campaign Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.campaign_status
  - name: Campaign Type
    title: Campaign Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.camp_type
  - name: Network Type
    title: Network Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_network_report
    listens_to_filters: []
    field: campaign_network_report.segments_ad_network_type
  - name: Included in ROAS
    title: Included in ROAS
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ad_report_v1
    explore: campaign_conversion_report
    listens_to_filters: []
    field: campaign_conversion_report.segments_conversion_action_name
