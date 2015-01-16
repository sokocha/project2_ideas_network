class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Lisa: removed :recoverable from the below because "we don't want our apps sending emails for now" (source: classnotes)
  
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
