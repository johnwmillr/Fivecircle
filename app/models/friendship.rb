class Friendship < ActiveRecord::Base
    belongs_to :user1_id, :class_name => 'user'
    belongs_to :user2_id, :class_name => 'user'
end
