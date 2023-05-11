class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  has_many :likes, dependent: :destroy

  validates :comment, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end