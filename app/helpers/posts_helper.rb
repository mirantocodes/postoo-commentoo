module PostsHelper
  def time_ago_in_words_only_today(time)
    if time > Time.now.beginning_of_day
      time_ago_in_words time
    elsif time > Time.now.beginning_of_year
      time.strftime("%b %d")
    else
      time.strftime("%b %d %Y")
    end
  end
end
