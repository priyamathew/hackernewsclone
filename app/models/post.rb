class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  def full_url
    url.include?('http://www')? url : "http://www.#{url}"
  end

end
