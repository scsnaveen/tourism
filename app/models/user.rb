

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

   validates :first_name, presence: true,format: { with: /\A[a-zA-Z]+\z/,message: "Please enter valid first name" }
   validates :last_name,presence: true,format: { with: /\A[a-zA-Z]+\z/,message: "Please enter valid last name" }
   validates :phone_number,numericality: { only_integer: true },presence: true,length: { minimum:6,maximum:10  }
      attr_accessor :avatar
	 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment :avatar, presence: true
   do_not_validate_attachment_file_type :avatar
   def picture_from_url(url)
    self.avatar = URI.parse(url).open
  end
  


  has_one_attached :image, :dependent => :destroy
end
