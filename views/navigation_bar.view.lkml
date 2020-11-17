include: "navigation_bar.view.lkml"
view: navigation_bar {

  measure: dash_nav {
    view_label: "Navigation"
    group_label: "Dashboard Navigation"
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <div style="background-color: #F6F6F7; height:500px;width:100%"></div>
      <div style="background-color: #F6F6F7; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
        <nav style="font-size: 18px; color: #4285F4">
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/36">Campaign Performance</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/37">Asset Performance Report</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/38">Geographic Report</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/39">Placement Report</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/40">Ads Disapproval Dashboard</a>
        </nav>
      </div>
    <div style="background-color: #F6F6F7; height:500px;width:100%"></div>;;
  }
}
  # measure: dash_nav_prod {
  #   view_label: "Navigation"
  #   group_label: "Dashboard Navigation"
  #   label: "Navigation Bar"
  #   type: string
  #   sql: "";;
  #   html:
  #   <div style="background-color: #F6F6F7; height:500px;width:100%"></div>
  #     <div style="background-color: #F6F6F7; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
  #       <nav style="font-size: 18px; color: #4285F4">
  #       <!-- for test >
  #         <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/28">Campaign Performance</a>
  #         <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/34">Asset Performance Report</a>
  #         <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/30">Geographic Report</a>
  #         <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/31">Placement Report</a>
  #         <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/35">Ads Disapproval Dashboard</a>
  #         >
  #       </nav>
  #     </div>
  #   <div style="background-color: #F6F6F7; height:500px;width:100%"></div>;;
  # }
# }
