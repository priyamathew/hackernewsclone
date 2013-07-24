class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password

  validates :username, uniqueness: :true, presence: true

  def karma
    post_karma = posts.inject(0) { |total, post| total + post.post_vote.vote_count}
    comment_karma = comments.inject(0) { |total, comment| total + comment.comment_vote.vote_count}

    total_karma = post_karma + comment_karma
  end

  def time_past
    seconds_ago = (Time.now - created_at).round
    minutes_ago = (seconds_ago/60)
    hours_ago = (minutes_ago/60)
    days_ago = (hours_ago/24)


    if days_ago.round == 1
      return "#{days_ago} day ago"
    elsif days_ago > 1 
      return "#{days_ago} days ago"
    elsif hours_ago.round == 1 
      return "#{hours_ago} hour ago"
    elsif hours_ago > 1 
      return "#{hours_ago} hours ago"
    elsif minutes_ago.round == 1 
      return "#{minutes_ago} minute ago"
    elsif minutes_ago > 1 
      return "#{minutes_ago} minutes ago"
    elsif seconds_ago.round == 1 
      return "#{seconds_ago} second ago"
    elsif seconds_ago > 0 
      return "#{seconds_ago} seconds ago"
    end

  end

end
