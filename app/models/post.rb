class Post < ApplicationRecord

  belongs_to :user
  belongs_to :tag
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :content,presence:true

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(content: content)
    elsif method == 'forward'
      Post.where('content LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('content LIKE ?', '%'+content)
    else
      Post.where('content LIKE ?', '%'+content+'%')
    end
  end

end
