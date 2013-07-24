class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamps

      t.belongs_to :post
      t.belongs_to :user
    end
  end
end
