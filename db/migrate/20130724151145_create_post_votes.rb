class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.belongs_to :post
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end
