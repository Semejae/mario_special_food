class User < ApplicationRecord

  Devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
