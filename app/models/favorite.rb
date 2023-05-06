class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post
  belongs_to :post_comment

  validates_uniqueness_of :post_id, scope: :user_id
  validates_uniqueness_of :post_comment_id, scope: :user_id


end