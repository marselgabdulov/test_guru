module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{repo}", target: "_blank"
  end

  def flash_notice(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
