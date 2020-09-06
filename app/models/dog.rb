class Dog < ActiveRecord::Base
    belongs_to :owner
    #Need to add migrations for dog attributes and foreign key owner_id so that another owner cannot edit
    #dog is analagous to post in previous labs but has more columns/attributes name, breed, size, age, 
    #temperament, about my pup as text description are some ideas
end
