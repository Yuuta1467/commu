class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy

         has_one_attached :profile_image

         enum helper_type: {未設定:0,介護職:1,在宅介護:2,その他:3}

         def active_for_authentication?
          super && (self.is_deleted == false)
         end

         def get_profile_image
           (profile_image.attached?) ? profile_image : 'no_image.jpg'
         end

end