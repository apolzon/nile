class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name
  attr_accessible :name, :email, :password, :password_confirmation
end
