class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
     self.email == "akirapanda@newnil.com" || self.role == "管理员" || self.email == "panxingyu@nosweetnopay.com" || self.email == "chentong0914@hotmail.com"
  end
end
