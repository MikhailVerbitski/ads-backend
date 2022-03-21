class User < ApplicationRecord
  extend Enumerize
  enumerize :role, in: %i[guest user admin], default: :guest

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  def admin?
    role == :admin
  end
end
