class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy

         has_one_attached :profile_image

         enum type: {介護職:0,在宅介護:1,その他:2}

         def active_for_authentication?
          super && (self.is_delete == false)
         end
end