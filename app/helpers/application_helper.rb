module ApplicationHelper
  # returns the full page title on a per-page basis
  def full_title(page_title = '')
    base_title = "Private Events"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
