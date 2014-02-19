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
    "background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.25)), url(#{@user.wallpaper});
     background-image: -moz-linear-gradient(to bottom, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.25)), url(#{@user.wallpaper});
     background-image: -o-linear-gradient(to bottom, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.25)), url(#{@user.wallpaper});
     background-image: -ms-linear-gradient(to bottom, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.25)), url(#{@user.wallpaper});
     background-image: -webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, 0.25)), to(rgba(0, 0, 0, 0.25))), url(#{@user.wallpaper});
     background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.25)), url(#{@user.wallpaper});
     background-size: cover;
     background-position: center;
     height: 100%;
     width: 40%;"
  end
end
