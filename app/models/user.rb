class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Lisa: removed :recoverable from the below because "we don't want our apps sending emails for now" (source: classnotes)

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable



  # This checks the user's role - as used by CanCanCan
  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
