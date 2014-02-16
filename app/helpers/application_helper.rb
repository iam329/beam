module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "TapeDeckHero"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def show_user_bg
    "background:transparent url(#{@user.wallpaper});
     background-size: cover;
     background-position: center;
     height: 450px;"
  end
end
