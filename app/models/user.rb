class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :patient_profiles
  has_many :doctor_profiles
  belongs_to :user_category
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :token_authenticatable,
         :omniauth_providers => [:facebook]
         def self.new_with_session(params, session)
           super.tap do |user|
             if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
               user.email = data["email"] if user.email.blank?
             end
           end
         end

         def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,20]
             user.name = auth.info.name   # assuming the user model has a name
             user.image = auth.info.image # assuming the user model has an image
           end
         end
end
