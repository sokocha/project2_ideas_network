class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Lisa: removed :recoverable from the below because "we don't want our apps sending emails for now" (source: classnotes) and :rememberable so that we don't get stuck as logged in

  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :ideas
  has_many :categories
  


  # This checks the user's role - as used by CanCanCan
  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
