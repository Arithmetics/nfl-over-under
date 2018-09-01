module ApplicationHelper

  # Returns the full title on a per-page basis

  def full_title(page_title = '')
    base_title = "NFL Over / Under Contest"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "desc" ? "asc" : "desc"
    link_to title, :sort => column, :direction => direction
  end

  def team_pic_url(bet_title)
    "/images/#{bet_title}.png"
  end


end
