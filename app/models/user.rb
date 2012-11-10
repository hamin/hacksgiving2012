class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone_number, :available
  # attr_accessible :title, :body

  scope :busy, where(:busy => true)
  scope :free, where(:busy => false)
  scope :available, where(:available => true)

  def self.available_user
  	self.available.free.first
  end
end
