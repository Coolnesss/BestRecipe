class User < ActiveRecord::Base
  has_secure_password

  validates :username,
      uniqueness: true,
      length: { in: 5..20 }
end
