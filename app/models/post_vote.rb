class PostVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
end
