class Followship < ApplicationRecord
  # 在特定的user_id下，只能有一個·following_id
  validates_uniqueness_of :following_id, scope: :user_id

  belongs_to :user
  belongs_to :following, class_name: "User"
end
