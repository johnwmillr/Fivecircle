class AddUserToFriendship < ActiveRecord::Migration
  def change
    add_reference :friendships, :user1, index: true, foreign_key: true
    add_reference :friendships, :user2, index: true, foreign_key: true
  end
end
