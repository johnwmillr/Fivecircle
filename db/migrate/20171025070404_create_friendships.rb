class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.primary_key :FriendshipId
      t.integer :UserId1
      t.integer :UserId2
      t.boolean :Agreed

      t.timestamps null: false
    end
  end
end
