class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes


  validates :username,
      uniqueness: true,
      length: { in: 4..20 }
end
