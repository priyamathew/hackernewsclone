class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_one :comment_vote

  after_create :create_comment_vote

   private

    def create_comment_vote
      CommentVote.create(comment_id: id)
    end


end
