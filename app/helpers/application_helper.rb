module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{repo}", target: "_blank"
  end

  def flash_notice(type)
    alert_style = type == "notice" ? "alert alert-success" : "alert alert-danger"
    content_tag :p, flash[type], class: alert_style if flash[type]
  end
end
