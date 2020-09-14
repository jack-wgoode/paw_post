 Specifications for the Sinatra Assessment
Specs:
- [x] Use Sinatra to build the app- used the Corneal generator to build MVC stub and added specific Owner, Dog models.
- [x] Use ActiveRecord for storing information in a database -has_many
- [x] Include more than one model class (e.g. User, Post, Category)
- [x] Include at least one has_many relationship on your User model -  User("Owner") has_many dogs
- [x] Include at least one belongs_to relationship on another model - dog belongs_to owner  foreign key owner_id
- [x] Include user accounts with unique login attribute (username or email)- essions_controller handles this while checking for a unique email and that      the password matches.Logout button is only displayed when owner is logged in. Links to login or signup are visible when user is not logged in. The current logged in user is displayed on every page.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Restful followed for get and post methods and patch using rack method override
- [x] Ensure that users can't modify content created by other users -the resource(dogs) is associated by a foreign key to owner. When the dog is created and persisted the logged in owner id is assigned to that dogs foreign key. While logged in, only the dogs that were created by the logged in user can be viewed, edited , or deleted. Logic in the dogs controller limits the user to the appropriate views.
Validate user input so bad data cannot be persisted to the database.
- [x] Include user input validations - since we are using active record, conditional statements are used to check errors on save. In the dog model, validates macros cover the user input on the new and edit dog form. It cannot be submitted with a missing field.
BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm
- [x] You have a large number of small Git commits - I have 31+ commits
- [x] Your commit messages are meaningful - specified the changes. 
- [x] You made the changes in a commit that relate to the commit message - as closely as possible. Still learning  github and naming conventions.
- [x] You don't include changes in a commit that aren't related to the commit message - there may be some html changes with code changes and I noted the most important fix or development.

