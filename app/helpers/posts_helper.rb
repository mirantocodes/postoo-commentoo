module PostsHelper
  def time_ago(time)
    if time > Time.now.beginning_of_day
      tag.time datetime: time.localtime.strftime("%H:%M"), class: 'text-secondary' do
        time_ago_in_words time
      end
    elsif time > Time.now.beginning_of_year
      tag.time datetime: time.strftime("%Y-%m-%d"), class: 'text-secondary' do
        time.strftime("%b %d")
      end
    else
      tag.time datetime: time.strftime("%Y-%m-%d"), class: 'text-secondary' do
        time.strftime("%b %d %Y")
      end
    end
  end
end
