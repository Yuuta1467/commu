class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  has_many :favorites, dependent: :destroy

  validates :comment, presence: true

end