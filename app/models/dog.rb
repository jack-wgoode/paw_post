class Dog < ActiveRecord::Base
    belongs_to :owner
    validates :name, presence: true
    validates :breed, presence: true
    validates :temperament, presence: true
    validates :comments, presence: true   
end
