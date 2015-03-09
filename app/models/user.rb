class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes


  validates :username,
      uniqueness: true,
      length: { in: 5..20 }
end
