class Owner < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :dogs
end
