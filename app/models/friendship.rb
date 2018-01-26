class Friendship < ApplicationRecord
  validates_uniqueness_of :friending_id, scope: :user_id
  belongs_to :user
  belongs_to :friending, class_name: "User"
end
