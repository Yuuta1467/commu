class Post < ApplicationRecord

  belongs_to :user
  belongs_to :tag
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :content,presence:true

end
