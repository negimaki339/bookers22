class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :books, dependent: :destroy
         attachment :profile_image
         validates :introduction, length: { maximum: 50 }
         validates :name, presence: true, 
         uniqueness: { case_sensitive: false },
         length: { minimum: 2, maximum: 20 }
         validates :email, presence: true
         validates :encrypted_password, presence: true
         
end
