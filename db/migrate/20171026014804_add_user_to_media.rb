class AddUserToMedia < ActiveRecord::Migration
  def change
    add_reference :media, :user, index: true, foreign_key: true
  end
end
