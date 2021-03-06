class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail

  after_create :send_admin_mail

  has_many :lists

  
def send_admin_mail
  UserMailer.send_welcome_email(self).deliver
end

end
