class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_one :post_vote

  after_create :create_post_vote
  
  def full_url
    url.include?('http://www')? url : "http://www.#{url}"
  end

  private

    def create_post_vote
      PostVote.create(post_id: id)
    end

end
