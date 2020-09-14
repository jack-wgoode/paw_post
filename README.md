Paw_Post
Introduction
''''''''''''''''''''''''''''''''''''''''''''
This application provides a very basic example of MVC and authentications. The requirements that guided it were:

Build an MVC Sinatra application. Use ActiveRecord with Sinatra. Use multiple models. Use at least one has_many relationship on a User model and one belongs_to relationship on another model. Must have user accounts - users must be able to sign up, sign in, and sign out. Validate uniqueness of user login attribute (username or email). Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user. Ensure that users can edit and delete only their own resources - not resources created by other users. Validate user input so bad data cannot be persisted to the database. BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)

The user story is to register their pup profiles for doggie daycare.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Code Samples
I made use of the advantages of ActiveRecord. For example, these models

class Dog < ActiveRecord::Base belongs_to :owner validates :name, presence: true validates :breed, presence: true validates :temperament, presence: true validates :comments, presence: true
end

class Owner < ActiveRecord::Base has_secure_password validates :email, presence: true, uniqueness: true has_many :dogs end

establish the relationships and validates input at account setup and login as well as forms.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Requirements and how they were met
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Build an MVC Sinatra application.

Use ActiveRecord with Sinatra.- establishes AR methods with Owner and Dog instances associated.

Use multiple models. Owner and Dog were used to model

Use at least one has_many relationship on a User model and one belongs_to relationship on another model. owner has_many dogs, dog belongs_to owner

*Must have user accounts - users must be able to sign up, sign in, and sign out.

Logout button is only displayed when owner is logged in. Links to login or signup are visible when user is not logged in. The current logged in user is displayed on every page.

*Validate uniqueness of user login attribute (username or email). -

sessions_controller handles this while checking for a unique email and that the password matches.

*Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.

*Ensure that users can edit and delete only their own resources - not resources created by other users.

the resource(dogs) is associated by a foreign key to owner. When the dog is created and persisted the logged in owner id is assigned to that dogs foreign key. While logged in, only the dogs that were created by the logged in user can be viewed, edited , or deleted. Logic in the dogs controller limits the user to the appropriate views.
Validate user input so bad data cannot be persisted to the database.

since we are using active record, conditional statements are used to check errors on save. In the dog model, validates macros cover the user input on the new and edit dog form. It cannot be submitted with a missing field.

BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)

sinatra-flash used to display errors at login attempts where the password does not match.

This project is subject to the MIT license and open source contributions are welcome.
https://opensource.org/licenses/MIT

Contributors
''''''''''''''''''''''''''''''''''''''''
Collaboration is learning and growth. I am always open to learning a better way. Public permissions.


Installation
The following gems are required:

gem 'session_secret_generator' gem 'sinatra' gem 'activerecord', '~> 5.0', '>= 5.0', :require => 'active_record' gem 'sinatra-activerecord', :require => 'sinatra/activerecord' gem 'rake' gem 'require_all' gem 'bcrypt' gem 'bigdecimal', '1.3.5' gem 'sinatra-flash'

The following gems are recommended for testing if you want to contribute: gem 'sqlite3', '~> 1.3.6' gem 'thin' gem 'shotgun' gem 'pry' gem 'tux'
