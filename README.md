## Bloccit: a Reddit replica to teach the fundamentals of web development and Rails.
 
 Made with my mentor at [Bloc](http://bloc.io).
 
## Bloccit

### Description:
Bloccit will be an app where people can post, vote on, share and save links and comments. Bloccit will have many features needed to make it a cool web app, but the first thing you need to do is design a basic user-interface (UI) as a foundation to build on.

#### Windows Users
If you are using a Windows machine you will need to log into your Cloud9. Once logged in, follow these steps to create a new workspace:

Click the "Create a new workspace" button.
Name your project "bloccit". Leave the Description field blank.
Choose "Public" for the git repository options. Leave the Clone from Git or Mercurial URL field blank.
Choose the "Rails/Ruby" template from the options below.
Click the "Create workspace" button.
Create Bloccit
The first step is to create a new Rails app. Run the rails new command in the code directory we created earlier:

#### Terminal
$ cd code
$ rails new bloccit -T
The app name is bloccit. The -T option specifies that the app should not be created with standard test packages since we'll be testing our app with RSpec.

When we ran the rails new command, we should've seen a long output in your console. Among other things, rails new creates the Rails app structure. Open the project in the editor to explore the Rails app structure.

#### Create a New README
A README file should describe what the app or program does. It should also provide directions on how to install it, run tests, or anything else that another developer would need to know.

Create the Development Database
Replace the contents of your Gemfile with the following:

Gemfile
```
 source 'https://rubygems.org'
 
 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'
 
 # #1
 group :production do
   # Use pg as the production database for Active Record
   gem 'pg'
 end
 
 # #2
 group :development do
   # Use sqlite3 as the development database for Active Record
   gem 'sqlite3'
 end
 
 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'
 
 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
 
 gem 'thor', '0.19.1'
 
 group :development do
   gem 'listen', '~> 3.0.5'
 end
 ```
 
At #1 and #2 we specify different databases for our Development and Production environments. We use sqlite3 for our Development environment because it is an easy to use database perfect for rapid testing. Heroku only supports Postgres, so we use pg in our Production environment.

Because we changed your Gemfile, we must update our application with  bundle install --without production. This command installs everything specified in the Gemfile and ensures that all of the gems work harmoniously. The  --without production option ignores gems in group :production. These gems aren't needed or used in our Development environment. Our Production environment will automatically run bundle install when we deploy, and will account for gems declared in group :production at that point. On the command line, in the root  Bloccit directory, type:

#### Terminal
$ bundle install --without production
Run the following command in your terminal to create the database:

#### Terminal
$ rails db:create
This creates a new local database for our app to use. We have to run this command after creating a new app, or after dropping an existing database.

Gemfile
```
 ...
 group :production do
   # Use pg as the production database for Active Record
   gem 'pg'
   gem 'rails_12factor'
 end

 group :development do
   # Use sqlite3 as the development database for Active Record
   gem 'sqlite3'
 end
 ...
 ```
We added rails_12factor to the Gemfile; let's install it in our application:
```
Terminal
$ bundle install
```
Heroku provides a detailed explanation of the Rails 4 configuration changes.

Test Locally
Start the Rails server from your command line:

#### Terminal
$ rails s
If you're using Cloud9, remember to start the Rails server with the  -p $PORT -b $IP flags.

Navigate to localhost:3000 to make sure the app is working locally.

Starting the web server with rails s will leave your terminal in an "open" state. That is, you won't see a command prompt until you stop the server. Open your app on localhost and view it next to the terminal where you started the server. Refresh the page on localhost, and you'll see the server logs update in your terminal. While you're running the Rails web server, the terminal logs all activity in your app.

#### Git and GitHub
Sign into your GitHub account and create a new repo named bloccit. You've already created a README, so make sure the "Initialize this repository with a README" is unchecked.

Commit and push your code up to your GitHub repo:

If your Rails server is still running, you can either stop it by pressing CTRL-C or leave it running and open a new Terminal tab. Either way, you'll need a Terminal prompt before moving forward.

#### Terminal
$ git init
$ git add .
$ git commit -m 'First commit and README update'
$ git remote add origin git@github.com:<user name>/<repo_name>.git
$ git push -u origin master
Use the URL from GitHub's instructions.

Reload the repo homepage on GitHub. It should display the content from README.md at the bottom of the page and you should see all of this repo's files.

#### Deploying to Heroku
It is time to deploy and share your app with the world. There are many choices for deploying and hosting Rails applications, and Bloc recommends the popular Heroku platform. Heroku makes it easy to manage and deploy Rails apps using the command line.

Sign up for a free Heroku account. Then install the Heroku Toolbelt for your OS. This toolbelt will allow you to run Heroku commands from the command line.

If you're using Cloud9, the Heroku toolbelt is already installed.

Log into your new Heroku account:

#### Terminal
$ heroku login
After you've logged in, create a new application in Heroku:

#### Terminal
$ heroku create
Because we did not specify a name with heroku create, Heroku created one for us.

We have a Production environment to push our application to. Type this command to push the code from the master branch of your Git repo to Heroku:

#### Terminal
$ git push heroku master
It may take a few minutes for the new application to propagate in Heroku. If you receive an error that says Permission denied (publickey), go here to learn how to fix it.

### Generating a Controller and Views
The best way to understand the relationship between controllers and views is to create them. We could create controller and view files manually, but Rails provides a handy generator which ensures that all necessary files are generated for a given controller. To generate a controller and its views, type the following on your command line in your project's directory:

Terminal
$ rails generate controller welcome index about
The output should look like this:
```
Terminal
      create  app/controllers/welcome_controller.rb
       route  get 'welcome/about'
       route  get 'welcome/index'
      invoke  erb
      create    app/views/welcome
      create    app/views/welcome/index.html.erb
      create    app/views/welcome/about.html.erb
      invoke  helper
      create    app/helpers/welcome_helper.rb
      invoke  assets
      invoke    js
      create      app/assets/javascripts/welcome.js
      invoke    scss
      create      app/assets/stylesheets/welcome.scss
      ```
We passed three arguments to the rails generate command. The first argument represents the controller name, which is welcome. The next two arguments (index and about) represent views corresponding with the welcome controller. We could've named the controller and views anything, but the names should correspond with their primary function, as a best practice.

Exploring Controllers and Views
Open your project in your text editor. You should see a file named  welcome_controller.rb in app/controllers/. You should also see the two views you created in app/views/welcome/. The generator created some code:

app/controllers/welcome_controller.rb
```
class WelcomeController < ApplicationController
  def index
  end

  def about
  end
end
```
WelcomeController is a Ruby class, and contains two empty methods that correspond to view names. These identically named methods and views are an example of a Rails convention called default rendering. When a controller method's purpose is to invoke a view, it must be named with respect to the view. The index method in the  WelcomeController will invoke the index view inside the app/views/welcome directory.

Open the index and about views and read the placeholder code:

app/views/welcome/index.html.erb
```
<h1>Welcome#index</h1>
<p>Find me in app/views/welcome/index.html.erb</p>
app/views/welcome/about.html.erb
<h1>Welcome#about</h1>
<p>Find me in app/views/welcome/about.html.erb</p>
```
Start the Rails server from your command line:

Terminal
$ rails s
Visit localhost:3000/welcome/index and localhost:3000/welcome/about to view the HTML code that was created by the controller generator.

#### Routing in Rails
The controller generator created the basic code needed for the WelcomeController and its views, and it also created code in the config/routes.rb file:

config/routes.rb
```
Rails.application.routes.draw do
  get "welcome/index"

  get "welcome/about"
  ...
end
```
This code creates HTTP GET routes for the index and about views. 

config/routes.rb
```
 Rails.application.routes.draw do
   get "welcome/index"

   get "welcome/about"

   root 'welcome#index'
 ...
 end
 ```
The root method allows us to declare the default page the app loads when we navigate to the home page URL. Test it by going to localhost:3000. You should see the welcome index view by default.

View your app's available routes by typing rails routes from the command line. Stop the Rails server (CTRL+C) and give it a try. You should see the following output:

Terminal
$ rails routes
```
       Prefix Verb URI Pattern              Controller#Action
welcome_index GET /welcome/index(.:format) welcome#index
welcome_about GET /welcome/about(.:format) welcome#about
         root GET /                        welcome#index
         ```
Test code is used to state expectations that are to be met when production code - the code that runs an application - is executed. Test code raises errors when its stated expectations are not met by production code. The two primary reasons to write test code are:

To ensure that production code does what it's intended to do; and
To ensure that production code doesn't break when you refactor it. Refactoring is "the process of restructuring existing computer code – changing the factoring – without changing its external behavior".

#### RSpec
There are several testing frameworks for developing web applications with Rails, but we'll focus on RSpec because it is the canonical framework, and thus the most likely framework you will encounter as a professional Rails developer.

Add the rspec-rails and rails-controller-testing gems to your Gemfile:

Gemfile
```
 ...

 group :development, :test do
   gem 'rspec-rails', '~> 3.0'
   gem 'rails-controller-testing'
 end
 ```
We added the gems to the :development and :test groups because we want its tasks and generators to be available in both environments. We specified a version (~> 3.0) for rspec-reails to maintain predictable behavior despite new RSpec releases.

Run bundle from the command line to update your application with the installation of RSpec. Use the RSpec generator to configure Bloccit for testing:

Terminal
$ rails generate rspec:install
```
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
      ```
This generator creates a spec directory where we will write our tests.

RSpec will now automatically add test files for our models and controllers when we run rails generate model... or rails generate controller....

#### The Test Database
Tests should be run in isolation because they can alter data stored in a database. That is, if we were to run tests in a Production environment, the tests could alter production data - that would be a very bad thing to do. Running tests in isolation is somewhat standard behavior for web development in general, so by default Rails designates a separate database for testing.

#### Red, Green, Refactor
The TDD process involves three steps:

1. Write a failing test for production functionality that does not exist. (Red)
1. Ensure that the test actually fails. This verifies two aspects of the test: first, it demonstrates that the new spec does not pass with the existing code you've written, saving you from writing unnecessary code; second, it precludes the possibility that your test always passes, which could be an indication of a poorly-written test.
1. Create the production functionality such that the test passes. (Green)
1. Refactor the production code to make it cleaner and more sustainable. With a well-written test, you can refactor production code with the confidence that you will not break the application. If you refactor your code in such a way that would break the application, your test would fail and you would know to fix the problem that caused the failure.
1. We call this three-step process "Red, Green, Refactor", because of the colored command line output of running tests.

Our First Test
Let's create our first set of specs to test the WelcomeController actions. Generate a spec for WelcomeController:

Terminal
$ rails generate rspec:controller welcome
      create  spec/controllers/welcome_controller_spec.rb
This command generates a spec file - welcome_controller_spec.rb - and places it in the spec/controllers directory. All specs will be written in the spec directory and are nested according to which part of the codebase they test. Open  welcome_controller_spec.rb and add a test for the index action:

spec/controllers/welcome_controller_spec.rb
```
 require 'rails_helper'

 # #1
 RSpec.describe WelcomeController, type: :controller do
   describe "GET index" do
     it "renders the index template" do
 # #2
       get :index
 # #3
       expect(response).to render_template("index")
     end
   end
 end
 ```
At #1, we describe the subject of the spec, WelcomeController.
We use get, at #2, to call the index method of WelcomeController.
At #3, we expect the controller's response to render the index template.
Run welcome_controller_spec.rb to confirm that the new test passes:

Terminal
$ rspec spec/controllers/welcome_controller_spec.rb
.

Finished in 0.0162 seconds (files took 2.75 seconds to load)
1 example, 0 failures
If you receive a message that says "...db/schema.rb doesn't exist yet" disregard it for now. We'll address it in a later checkpoint.

Let's add a similar test for the about method:

spec/controllers/welcome_controller_spec.rb
```
 require 'rails_helper'

 RSpec.describe WelcomeController, type: :controller do
   describe "GET index" do
     it "renders the index template" do
       get :index
       expect(response).to render_template("index")
     end
   end
 
   describe "GET about" do
     it "renders the about template" do
       get :about
       expect(response).to render_template("about")
     end
   end
end
```
Run the spec again:

Terminal
$ rspec spec/controllers/welcome_controller_spec.rb
..

Finished in 0.0199 seconds (files took 2.96 seconds to load)
2 examples, 0 failures

### HTML, Ruby, and application.html.erb
The index and about views have an .html.erb file extension. This file extension allows us to use HTML and Ruby (ERB stands for "embedded Ruby") in the same file. By integrating Ruby code with HTML, we can dynamically change the behavior of static HTML code, based on user input.

Nearly every view in a Rails application will have some unique HTML and Ruby code, but there is also common code that needs to be included in all views. Rather than repeating the same code in every view, we use application.html.erb. Each view (like index and about) is called from, and rendered inside, application.html.erb. In this way, you can think of application.html.erb as a container file that has HTML and Ruby code needed to run every view in a Rails app.

Modify the application.html.erb file to include additional HTML and Ruby that we need in every view in Bloccit:

app/views/layouts/application.html.erb
```
 <!DOCTYPE html>
 <html>
   <head>
     <title>Bloccit</title>
     <%= csrf_meta_tags %>

     <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
   </head>

   <body>
     <ul>
       <li><%= link_to "Home", welcome_index_path %></li>
       <li><%= link_to "About", welcome_about_path %></li>
     </ul>

     <%= yield %>

   </body>
 </html>
 ```
Start the Rails server and make sure that you are directed to the correct pages when you click the "Home" and "About" links.

Terminal
$ rails s

CSS Selectors in Rails
Let's use CSS to modify the font color of h1 tags :

app/assets/stylesheets/welcome.scss
```
 ...
 h1 {
   color: red;
 }
 ```

View the index and about pages. The content between the h1 tags should be red now. There are a few important things to note about the code above:

The CSS we added was in the welcome.scss file. When we ran  rails generate controller, welcome.scss was created. By Rails convention, each controller has a corresponding stylesheet and view.
Similar to the .html.erb extension, the .scss extension provides us with some additional syntax options (known as Sass) to enhance default CSS capabilities. 

Stop the Rails server, open Gemfile and add the bootstrap-sass gem at the bottom of the Gemfile (make sure it is outside of a group):

Gemfile
```
...
 gem 'bootstrap-sass'
 ```
Run bundle install to install the new gem.
Rename application.css to application.scss:

Terminal
$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
Add the following lines to the bottom of application.scss, to integrate the newly installed Bootstrap with our application:

app/assets/stylesheets/application.scss
```
 @import "bootstrap-sprockets";
 @import "bootstrap";
Include the Bootstrap file in app/assets/javascripts/application.js:
app/assets/javascripts/application.js
 //= require jquery
 //= require jquery_ujs
 //= require turbolinks
 //= require bootstrap
 //= require_tree .
 ```
To use Bootstrap's styles, add some of its layout classes to our container HTML:

app/views/layouts/application.html.erb
```
<!DOCTYPE html>
<html>
  <head>
    <title>Bloccit</title>
    <%= csrf_meta_tags %>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <ul>
    <div class="container">
      <ul class="nav nav-tabs">
        <li><%= link_to "Home", welcome_index_path %></li>
        <li><%= link_to "About", welcome_about_path %></li>
      </ul>

      <%= yield %>
    </div>

  </body>
</html>
```
The "viewport meta" tag added inside the <head> with a content attribute value of  width=device-width, initial-scale=1 instructs browsers on small, high-pixel density screens (such as retina iPhones) to display our pages at a regular, readable size. Without this tag, our pages won't scale properly.

container, nav, and nav-tabs are classes provided by Bootstrap. By assigning these classes to HTML elements like <div> and <ul>, you are styling them with default Bootstrap properties and values.

Remove the CSS rules you added to welcome.scss as well as the HTML changes you made in the index view (leaving the two @import lines). They were for demonstration only.

Restart the Rails server and observe the changes.

### POST
The first model we'll create is Post. Users should have the ability to submit posts to Bloccit with titles and descriptions, so the Post model and its corresponding database table will need two attributes: title and body.

Use a generator to create Post and its corresponding spec:

Terminal
```
$ rails generate model Post title:string body:text
      invoke  active_record
   identical    db/migrate/20150606010447_create_posts.rb
   identical    app/models/post.rb
      invoke    rspec
      create      spec/models/post_spec.rb
      ```
Use cat to see the contents of the spec file:

Terminal
```
$ cat spec/models/post_spec.rb
 require 'rails_helper'

 RSpec.describe Post, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"
 end
 ```
This is the template for a simple spec. We'll use TDD to define the behavior for Post. Add the following tests:

spec/models/post_spec.rb
```
 require 'rails_helper'

 RSpec.describe Post, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"
 # #1
   let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
 
 # #2
   describe "attributes" do
     it "has title and body attributes" do
       expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
     end
   end
 end
 ```
At #1, using the let method, we create a new instance of the Post class, and name it post. let dynamically defines a method (in this case, post), and, upon first call within a spec (the it block), computes and stores the returned value.

At #2, we test whether post has attributes named title and body. This tests whether post will return a non-nil value when post.title and post.body is called.

Use cat to see the contents of post.rb, which was also created with a basic template:

Terminal
$ cat app/models/post.rb
class Post < ApplicationRecord
end

ApplicationRecord essentially handles interaction with the database and allows us to persist data through our class. Run the spec:

Terminal
$ rspec spec/models/post_spec.rb
You will see a verbose error, but focus on the first line:

Terminal
schema.rb doesn't exist yet. Run `rails db:migrate` to create it, then try again.
RSpec reported that schema.rb doesn't exist. schema.rb is a file located in the db directory that represents an application's complete database architecture; the tables it uses and how those tables relate to each other. We don't have schema.rb because we have not yet created the database or any tables. The generator created the migration file, but we haven't executed that file yet. We'll do that now:

Terminal
$ rails db:migrate
== 20150606010447 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0016s
== 20150606010447 CreatePosts: migrated (0.0017s) =============================

rails db:migrate created a new table named "posts". Let's review the migration file, which is the only file in the db/migrate directory (its name begins with a timestamp, and so will differ from the one below):

db/migrate/20150606010447_create_posts.rb
```
$ cat db/migrate/20150606010447_create_posts.rb
class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
```
The migration is written in Ruby. 
Run the tests in post_spec.rb again:

Terminal
$ rspec spec/models/post_spec.rb
..

Finished in 0.00817 seconds (files took 1.67 seconds to load)
1 examples, 0 failures
Our tests passed, so we know that the Post model has the attributes we expected.

### Comment
The Comment model needs one attribute - body - and a reference to Post. Let's create the spec, model, and migration files with the model generator:

```
Terminal
$ rails generate model Comment body:text post:references
      invoke  active_record
      create    db/migrate/20150608215948_create_comments.rb
      create    app/models/comment.rb
      invoke    rspec
      create      spec/models/comment_spec.rb
      ```
Open comment_spec.rb and add the following test:

spec/models/comment_spec.rb
```
 require 'rails_helper'

 RSpec.describe Comment, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"
   let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
   let(:comment) { Comment.create!(body: 'Comment Body', post: post) }
 
   describe "attributes" do
     it "has a body attribute" do
       expect(comment).to have_attributes(body: "Comment Body")
     end
   end
 end
 ```
Review comment.rb:

app/models/comment.rb
```
$ cat app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post
end
```
Review the create_comments migration in the db/migrate directory and add a foreign key:

db/migrate/20140624203804_create_comments.rb
```
 class CreateComments < ActiveRecord::Migration[5.0]
   def change
     create_table :comments do |t|
       t.text :body
       t.references :post, foreign_key: true

       t.timestamps
     end
   end
 end
 ```
Since we have a new migration file, we shall once again run the migrations, adding the comments table to the database:

Terminal
```
$ rails db:migrate
== 20150608215948 CreateComments: migrating ===================================
-- create_table(:comments)
   -> 0.0021s
== 20150608215948 CreateComments: migrated (0.0022s) ==========================
```
The results above tell us that the tables and attributes have been created successfully.

Run comment_spec.rb:

Terminal
$ rspec spec/models/comment_spec.rb
.

Finished in 0.01325 seconds (files took 1.78 seconds to load)
1 example, 0 failures

### Updating Post
Remember that when we use a model generator, the resulting model inherits from a class named ApplicationRecord by default. This inheritance pattern provides methods that the model will need in order to interact with tables in the database. Our comment class already relates to our post class, thanks to the model generator, but the post class does not yet relate to the comment class. Let's create that relation:

app/models/post.rb
```
 class Post < ApplicationRecord
   has_many :comments
 end
 ```
The has_many method allows a post instance to have many comments related to it, and also provides methods that allow us to retrieve comments that belong to a post.

The Rails console loads our application in a shell, and provides access to Rails methods, app-specific methods, persisted data, and Ruby. To launch the console from the command line, enter:

Terminal
$ rails c
And you should see the following message and prompt, or something very similar:

Console
Loading development environment (Rails 4.2.5)
2.2.1 :001 >
Because the console provides access to our application code, we can create posts and comments within the console, from the command line. Let's create a new post instance:

Console
> Post.create(title: "First Post", body: "This is the first post in our system")
Creating a post would not be possible in IRB because posts and comments are specific to our application. Ruby (which is the only language that IRB understands) would not know what a "Post" is, and would throw an error.

```
Console
   (0.1ms)  begin transaction
 # #1
  SQL (0.8ms)  INSERT INTO "posts" ("title", "body", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "First Post"], ["body", "This is the first post in our system"], ["created_at", "2015-06-10 18:30:38.756344"], ["updated_at", "2015-06-10 18:30:38.756344"]]
 # #2
   (0.6ms)  commit transaction
 => #<Post id: 1, title: "First Post", body: "This is the first post in our system", created_at: "2015-06-10 18:30:38", updated_at: "2015-06-10 18:30:38">
 ```
At #1, we add a row to the posts table using the INSERT INTO SQL statement.  "title", "body", "created_at", "updated_at", are the column names (i.e. attributes) on the posts table. The list of values after VALUES (?, ?, ?, ?) in brackets ([["title", "First Post"] ... ]) are values that correspond to the column names. The created_at and updated_at columns are default columns that Rails adds automatically, which is why we didn't need to specify them in the create call.

At #2, we commit the transaction which executes INSERT INTO. Commit statements end a SQL transaction and make all changes permanent. A transaction is one or more SQL statements that a database treats as a single unit.

We now have one row in the posts table.

### Retrieving Information
It is important to remember that a row in a table corresponds to an instance of a class. Like a class instance, a row in a database table is unique. ORM allows us to retrieve information stored in a row and map it to a class instance that we create in our application. Let's retrieve a row from the posts table and map it to an instance of the Post class:

Console
```
> post = Post.first

  # #3
  Post Load (0.2ms)  SELECT  "posts".* FROM "posts"  ORDER BY "posts"."id" ASC LIMIT 1
 => #<Post id: 1, title: "First Post", body: "This is the first post in our system", created_at: "2015-06-10 18:30:38", updated_at: "2015-06-10 18:30:38">
 ```
At #3 Post.first executes a SELECT SQL statement and fetches the first row from the posts table. SELECT is used to fetch a set of records from one or more tables.

After the first row is fetched, ActiveRecord converts the row's data into an instance of  Post, or a post object. This post object is then assigned to the post variable.  ActiveRecord makes this conversion from a database record to Ruby object possible.

Now that our instance is assigned, print it to view its value:

Console
```
> post
 => #<Post id: 1, title: "First Post", body: "This is the first post in our system", created_at: "2015-06-10 18:30:38", updated_at: "2015-06-10 18:30:38">
 ```
post is populated by the first row of data (currently the only row of data) in our posts database table.

Let's add a comment to the post we retrieved:

Console
```
> post.comments.create(body: "First comment!")
   (0.1ms)  begin transaction
  SQL (0.4ms)  INSERT INTO "comments" ("body", "post_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["body", "First comment!"], ["post_id", 1], ["created_at", "2015-06-10 19:50:29.881194"], ["updated_at", "2015-06-10 19:50:29.881194"]]
   (0.7ms)  commit transaction
 => #<Comment id: 1, body: "First comment!", post_id: 1, created_at: "2015-06-10 19:50:29", updated_at: "2015-06-10 19:50:29">
 ```
Because we chained the method calls - post.comments.create - ActiveRecord interpreted this as "create a new comment for the first post". If we didn't specify the post to create a comment for, ActiveRecord would not have been able to update the  post_id, which is critical because it defines the relationship between posts and comments. Inspect post.comments:

Console
```
> post.comments
Comment Load (2.6ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ?  [["post_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 1, body: "First comment!", post_id: 1, created_at: "2015-07-21 12:00:56", updated_at: "2015-07-21 12:00:56">]>
post.comments returns an ActiveRecord::Association because a comment depends on a given post. We'll explore associations in the next section.
```

ActiveRecord Associations
We defined the relationships between posts and comments in their respective classes, with has_many and belongs_to. These relationships are known as associations.

The belongs_to :post declaration in Comment generates a post method for each comment, giving us the ability to call .post on an instance of Comment and retrieve the associated post. The database stores this relationship, by keeping a post_id (foreign key) for each comment.

Retrieve the first comment in the comments table, and assign it to a comment variable:

Console
```
> comment = Comment.first
```
Fetch the post that is associated with comment:

Console
```
> comment.post
  Post Load (0.4ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT 1  [["id", 1]]
 => #<Post id: 1, title: "First Post", body: "This is the first post in our system", created_at: "2015-06-10 18:30:38", updated_at: "2015-06-10 18:30:38">
 ```
Let's create another comment on post:

Console
```
> post.comments.create(body: "Second comment!")
```
The has_many :comments declaration in Post is the counterpart of belongs_to :post. The posts table makes no reference to comments. There's no comment_id column or array of comment_ids in the posts table. Instead, this relationship is stored in the comments table exclusively. A post retrieves its associated comments by fetching all the comments with a post_id that matches the id of the post. Storing the relationship in the comments table is a database strategy to allow data to be intersected or joined in an efficient manner.

Now that we have two comments associated with a single post, let's iterate over them using Ruby:

Console
```
# #4
>  post.comments.each { |comment| p comment.body }
# #5
  Comment Load (0.2ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ?  [["post_id", 1]]
"First comment!"
"Second comment!"
 => [#<Comment id: 1, body: "First comment!", post_id: 1, created_at: "2015-06-10 19:50:29", updated_at: "2015-06-10 19:50:29">, #<Comment id: 2, body: "Second comment!", post_id: 1, created_at: "2015-06-10 22:31:36", updated_at: "2015-06-10 22:31:36">]
At #4, the |comment| block argument represents an instance of Comment with each iteration. We call body on each comment instance to retrieve the comment's body attribute from the database.

At #5, the SELECT statement fetches all the comments with the given post_id.

We've added database records manually through the Rails Console, but in a development environment it's helpful to have lots of data to work with. It would be monotonous to add many records manually, so we'll programmatically add fake data to Bloccit.

### Generating Seed Data
Open db/seeds.rb and remove the commented lines. seeds.rb is a script (a small utility program) we can run to seed the development database with test data. Add the following code:

db/seeds.rb
```
 require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 ```
At #1, we use create! with a bang (!). Adding a ! instructs the method to raise an error if there's a problem with the data we're seeding. Using create without a bang could fail without warning, causing the error to surface later.

At #2, we use methods from a class that does not exist yet, RandomData, that will create random strings for title and body. Writing code for classes and methods that don't exist is known as "wishful coding" and can increase productivity because it allows you to stay focused on one problem at a time.

At #3, we call times on an Integer (a number object). This will run a given block the specified number of times, which is 100 in this case. The end result of calling times is similar to that of a loop, but in this use-case, it is easier to read and thus more idiomatic.

At #4, we call sample on the array returned by Post.all, in order to pick a random post to associate each comment with. sample returns a random element from the array every time it's called.

#### RandomData
RandomData does not exist, so let's create it. Create a file named random_data.rb in the lib (short for "library") directory:

Terminal
$ touch lib/random_data.rb
Open random_data.rb and add the following code:
```
 # #5
  module RandomData
 # #6
   def self.random_paragraph
     sentences = []
     rand(4..6).times do
       sentences << random_sentence
     end
 
     sentences.join(" ")
   end
 
 # #7
   def self.random_sentence
     strings = []
     rand(3..8).times do
       strings << random_word
     end
 
     sentence = strings.join(" ")
     sentence.capitalize << "."
   end
 
 # #8
   def self.random_word
     letters = ('a'..'z').to_a
     letters.shuffle!
     letters[0,rand(3..8)].join
   end
 end
 ```
At #5, we define RandomData as a module because it is a standalone library with no dependencies or inheritance requirements. Modules help keep common functions organized and reusable throughout our application. Unlike classes, we can't instantiate or inherit from modules. Instead we use them as mixins to add functions to multiple classes.

At #6, we define random_paragraph. We set sentences to an array. We create four to six random sentences and append them to sentences. We call join on sentences to combine each sentence in the array, passing a space to separate each sentence. join combines each sentence into a full paragraph (as a string).

At #7, we follow the same pattern as we did in #6 to create a sentence with a random number of words. After we generate a sentence, we call capitalize on it and append a period. capitalize returns a copy of sentence with the first character converted to uppercase and the remainder of the sentence converted to lowercase.

At #8, we define random_word. We set letters to an array of the letters a through z using to_a. We call shuffle! on letters in place. If we were to call shuffle without the bang (!), then shuffle would return an array rather than shuffle in place. We  join the zeroth through nth item in letters. The nth item is the result of  rand(3..8) which returns a random number greater than or equal to three and less than eight.

Let's make random_data.rb accessible to all our of specs going forward. Adding it to  application.rb autoloads any references to the lib directory used by our code:

 ...
     # Settings in config/environments/* take precedence over those specified here.
     # Application configuration should go into files in config/initializers
     # -- all .rb files in that directory are automatically loaded.
     +    config.autoload_paths << File.join(config.root, "lib")
   end
 end
Drop the database and run seeds.rb by typing:

Terminal
$ rails db:reset
Seed finished
50 posts created
100 comments created
Open the Rails console to randomly check some results:

Console
$ rails c

> p = Post.find(3)
We called another ActiveRecord class method, find, on Post and passed it a value which represents a unique post id. find will return the instance (row) of post data which corresponds to an id of 3. You should see an output with a funny looking  title and body as that's what  RandomData created in seeds.rb. Run the following methods to view how many comments the given post has:

Console
> p.comments.count
count is an ActiveRecord method that can be called on an ActiveRecord relation.  p.comments returns an ActiveRecord relation, so count is a valid method to call on it.

Type exit to exit the console.

## Generating a Resource
A resource has three components which align to MVC architecture: a model, view(s), and a controller. We'll build a resource for posts first, and because we already have a post model, we'll create a controller next:

Terminal
$ rails generate controller Posts index show new edit
We passed the controller generator five arguments, including the resource name,  Posts. Review the following output:

Terminal
```
      create  app/controllers/posts_controller.rb
       route  get 'posts/edit'
       route  get 'posts/new'
       route  get 'posts/show'
       route  get 'posts/index'
      invoke  erb
      create    app/views/posts
      create    app/views/posts/index.html.erb
      create    app/views/posts/show.html.erb
      create    app/views/posts/new.html.erb
      create    app/views/posts/edit.html.erb
      invoke  rspec
      create    spec/controllers/posts_controller_spec.rb
      create    spec/views/posts
      create    spec/views/posts/index.html.erb_spec.rb
      create    spec/views/posts/show.html.erb_spec.rb
      create    spec/views/posts/new.html.erb_spec.rb
      create    spec/views/posts/edit.html.erb_spec.rb
      invoke  helper
      create    app/helpers/posts_helper.rb
      invoke    rspec
      create      spec/helpers/posts_helper_spec.rb
      invoke  assets
      invoke    js
      create      app/assets/javascripts/posts.js
      invoke    scss
      create      app/assets/stylesheets/posts.scss
      ```
Open routes.rb and view the get method calls the controller generator added:

config/routes.rb
```
Rails.application.routes.draw do
  get "posts/index"

  get "posts/show"

  get "posts/new"

  get "posts/edit"

  get "welcome/index"
  get "welcome/about"

  root 'welcome#index'
end
```
The generated get method calls create routes for the post resource, but Rails offers a more succinct syntax. Let's refactor routes.rb with the resources method:

config/routes.rb
```
 Rails.application.routes.draw do
   get "posts/index"
 
   get "posts/show"
 
   get "posts/new"
 
   get "posts/edit"

 # #1
   resources :posts

 # #2
   get "welcome/index"
 
   get "welcome/about"
   get 'about' => 'welcome#about'

   root 'welcome#index'
 end
 ```
At #1, we call the resources method and pass it a Symbol. This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post. We'll review the precise URIs created in a moment.

At #2, we remove get "welcome/index" because we've declared the index view as the root view. We also modify the about route to allow users to visit /about, rather than  /welcome/about.

The Rails router uses routes.rb. Let's watch a video exploring the important role the Rails router plays:


Run rails routes from the command line:
```
Terminal
$ rails routes
 # #3
   Prefix Verb   URI Pattern               Controller#Action
 # #4
    posts GET    /posts(.:format)          posts#index
          POST   /posts(.:format)          posts#create
 new_post GET    /posts/new(.:format)      posts#new
edit_post GET    /posts/:id/edit(.:format) posts#edit
     post GET    /posts/:id(.:format)      posts#show
 # #5
          PATCH  /posts/:id(.:format)      posts#update
          PUT    /posts/:id(.:format)      posts#update
          DELETE /posts/:id(.:format)      posts#destroy
    about GET    /about(.:format)          welcome#about
     root GET    /                         welcome#index
     ```
At #3, we see a header with Prefix, Verb, URI Pattern, and Controller#Action. The verbs correspond to HTTP Request Methods. They specify the action to be done on the specified resource. 

At #4, Rails created a route to /posts which requires a GET. The route maps to the  index method in  PostsController.

At #5, we see PATCH and PUT verbs, which are similar. PUT updates data by sending the complete resource, whereas PATCH sends just the changes.

#### CRUD
CRUD stands for Create Read Update Delete. CRUD actions align with controller HTTP verbs and controller actions in a Rails app.

CRUD Action	HTTP Verb	Rails Action(s)
Create	POST	create
Read	GET	new/show/index/edit
Update	PUT/PATCH	update
Delete	DELETE	destroy
Start your Rails server and visit http://localhost:3000/posts. We see a NameError like the one below:

path-error
This error happens because we're using a generated path helper that no longer exists. When we changed our routes, we changed our path helpers. In particular, we changed welcome_index_path to root_path and welcome_about_path to about_path.

Update the application layout to reflect the new paths:

app/views/layouts/application.html.erb
```
 ...
       <li><%= link_to "Home", welcome_index_path %></li>
       <li><%= link_to "About", welcome_about_path %></li>
       <li><%= link_to "Bloccit", root_path %></li>
       <li><%= link_to "About", about_path %></li>
 ...
 ```
Save the changes and refresh the page. We see the default HTML created by the controller generator at http://localhost:3000/posts – this view is the index page. We can deduce this from the rails routes output above, specifically this line:

Output
        posts GET    /posts(.:format)          posts#index
We can see that the /posts route (column three) is associated with the posts#index controller action (column four).

Index Action
Let's use TDD to write the index action in PostsController. When we generated our controller, Rails created a basic spec for PostsController:

spec/controllers/posts_controller_spec.rb
```
 require 'rails_helper'

 # #6
 RSpec.describe PostsController, type: :controller do

   describe "GET index" do
     it "returns http success" do
 # #7
       get :index
       expect(response).to have_http_status(:success)
     end
   end

   describe "GET show" do
     it "returns http success" do
       get :show
       expect(response).to have_http_status(:success)
     end
   end

   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit
       expect(response).to have_http_status(:success)
     end
   end

 end
 ```
At #6, RSpec created a test for PostsController. type: :controller tells RSpec to treat the test as a controller test. This allows us to simulate controller actions such as HTTP requests.

At #7, the test performs a GET on the index view and expects the response to be successful.

have_http_status is an RSpec matcher which encapsulates this logic.  have_http_status(:success) checks for a response code of 200, which is the standard HTTP response code for success.

The remaining tests follow the same pattern.

Let's add another test to posts_controller_spec.rb to define the expected behavior of the PostsController#index :

spec/controllers/posts_controller_spec.rb
```
 require 'rails_helper'

 RSpec.describe PostsController, type: :controller do
 # #8
   let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

   describe "GET index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end

     it "assigns [my_post] to @posts" do
       get :index
 # #9
       expect(assigns(:posts)).to eq([my_post])
     end
   end

 # #10
   describe "GET show" do
     it "returns http success" do
       get :show
       expect(response).to have_http_status(:success)
     end
   end

   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit
       expect(response).to have_http_status(:success)
     end
   end

 end
 ```
At #8, we create a post and assign it to my_post using let. We use RandomData to give my_post a random title and body.

At #9, because our test created one post (my_post), we expect index to return an array of one item. We use assigns, a method in ActionController::TestCase.  assigns gives the test access to "instance variables assigned in the action that are available for the view".

At #10, we comment out the tests for show, new, and edit since we won't write the implementation until later.

Run the spec:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb
We see output indicating our new test is failing. Let's write the implementation of  index to get both tests passing. In the PostsController, add the following to the  index method:

app/controllers/posts_controller.rb
```
 class PostsController < ApplicationController
   def index
 # #11
     @posts = Post.all
   end

   def show
   end

   def new
   end

   def edit
   end
 end
 ```
At #11, we declare an instance variable @posts and assign it a collection of Post objects using the all method provided by ActiveRecord. all returns a collection of  Post objects.

Run the spec again. The tests for index now pass. Our controller functions per the expectations of our spec for index. Let's write the associated view:

app/views/posts/index.html.erb
```
 <h1>Posts#index</h1>
 <p>Find me in app/views/posts/index.html.erb</p>
 <h1>All Posts</h1>
 # #12
 <% @posts.each do |post| %>
   <p><%= link_to post.title, post_path(post.id) %></p>
 <% end %>
 ```
At #12, we iterate over each post in @posts. For each post we create a link with  post.title as the text that links to /posts/id, with the id from the post.id. Instance variables created in a controller method are available in its associated view. Since we create and assign @posts in PostsController#index, we can use it in the posts index view.

Refresh http://localhost:3000/posts to see all the posts in the database.

Inspect the post_path method using rails routes | grep 'posts#show'. It requires an id to route to the correct post:

terminal
$ rails routes | grep 'posts#show'
  post GET    /posts/:id(.:format)      posts#show
We passed the id of the post instance to the post_path method. post_path used this id to create the path. We can pass the post instance to get the same path. The  post_path method will derive the id:

link_to post.title, post_path(post)
Rails simplifies this further by allowing us to skip the post_path method altogether. If we call link_to with the object to which we're linking as a second argument, the  link_to method will detect the object, parse its id, and create the path using the id. Using that shortcut, we can simplify the posts index view:

app/views/posts/index.html.erb
```
 <h1>All Posts</h1>
 <% @posts.each do |post| %>
   <p><%= link_to post.title, post %></p>
   <p><%= link_to post.title, post_path(post.id) %></p>
 <% end %>
 ```
This is an example of the advantages of Rails' "convention over configuration" approach.

Let's use Bootstrap to style the posts index view:

app/views/posts/index.html.erb
```
 <h1>All Posts</h1>
 <% @posts.each do |post| %>
   <p><%= link_to post.title, post %></p>
   <div class="media">
     <div class="media-body">
       <h4 class="media-heading">
         <%= link_to post.title, post %>
       </h4>
     </div>
   </div>
 <% end %>
 ```
posts-index
Bootstrap provides the classes we added to the <div> and h4 tags to improve our view.
 
### Creating Posts
In this checkpoint we'll develop, test-first, the functionality for creating posts. We'll also implement a user interface (UI) so that Bloccit users can create posts.

Let's write the controller tests:

spec/controllers/posts_controller_spec.rb
```
...

 #  describe "GET new" do
 #    it "returns http success" do
 #      get :new
 #      expect(response).to have_http_status(:success)
 #    end
 #  end

 # #1
    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
 # #2
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
 # #3
      it "instantiates @post" do
        get :new
        expect(assigns(:post)).not_to be_nil
      end
    end
 
    describe "POST create" do
 # #4
      it "increases the number of Post by 1" do
        expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
      end
 
 # #5
      it "assigns the new post to @post" do
        post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(assigns(:post)).to eq Post.last
      end
 
 # #6
      it "redirects to the new post" do
        post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(response).to redirect_to Post.last
      end
    end

 ...
 ```
There are separate new and create sections at #1 and #4. 

At #2, we expect PostsController#new to render the posts new view. We use the  render_template method to verify that the correct template (view) is rendered.

At #3, we expect the @post instance variable to be initialized by  PostsController#new. assigns gives us access to the @post variable, assigning it to  :post.

At #4, we expect that after PostsController#create is called with the parameters  {post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}, the count of Post instances (i.e. rows in the posts table) in the database will increase by one.

At #5, when create is POSTed to, we expect the newly created post to be assigned to @post.

At #6, we expect to be redirected to the newly created post.

Run the spec and see four failing tests that are caused because we haven't finished  new or create in PostsController.

The first two tests pass without our need to add any code to PostsController. By default, new will render the post's new view and return an HTTP success code. If we were to override this default behavior, we'd need to update these tests.

Let's implement the rest of the logic needed in new:

app/controllers/posts_controller.rb
```
 ...

 def new
 # #7
   @post = Post.new
 end

 ...
 ```
At #7, we create an instance variable, @post, then assign it an empty post returned by  Post.new.

Run the specs for new and observe that all three Get new tests pass:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'GET new'
-e 'GET new' runs only the specs in the describe "GET new" do block. This allows us to run only the specs covering the method we're working on.

#### The form_for Helper Method
Thanks to our updated new method in PostsController, we have the ability to access a new Post instance in the related posts new view. Open the new view and add the following code:

app/views/posts/new.html.erb
```
 <h1>Posts#new</h1>
 <p>Find me in app/views/posts/new.html.erb</p>
 <%= form_for @post do |f| %>
   <%= f.label :title %>
   <%= f.text_field :title %>
 
   <%= f.label :body %>
   <%= f.text_area :body %>
 
   <%= f.submit "Save" %>
 <% end %>
 ```
Start the Rails server and go to http://localhost:3000/posts/new. View the source of the resulting page by right clicking anywhere on the page, and selecting Inspect Element. Search for a form HTML tag and you should see the following HTML code:
```
 <!-- #8 -->
 <form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post" abineguid="67A412E19800485B8BEF9569F6FA75CC"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="u5qH11P+xwMWIZjSHS1DssY3qrmCUpY4k7iXuyqvc9OZl1CPWfXekmZ2XLbdblOfNE/jsX6vqkqy9YYY05QyJw==">
   <label for="post_title">Title</label>
   <input type="text" name="post[title]" id="post_title">

   <label for="post_body">Body</label>
   <textarea name="post[body]" id="post_body"></textarea>

   <input type="submit" name="commit" value="Save">
 </form>
 ```
form_for generates this HTML code starting at #8. form_for, like link_to, is a Rails helper method that generates HTML code. This code allows a user to submit a post title and body, thus creating a new post.

On http://localhost:3000/posts/new, enter some text into the title and body fields, then click the Save button. You should see an error message:

pic
The form attempted to submit the data to a create action, but Rails couldn't find a  create method in PostsController. Let's write create:

app/controllers/posts_controller.rb
```
 ...

   def new
     @post = Post.new
   end

   def create
 # #9
     @post = Post.new
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]

 # #10
     if @post.save
 # #11
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
 # #12
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end

 ...
 ```
At #9, we call Post.new to create a new instance of Post.

At #10, if we successfully save Post to the database, we display a success message using flash[:notice] and redirect the user to the route generated by @post. Redirecting to @post will direct the user to the posts show view.

At #11, we assign a value to flash[:notice]. The flash hash provides a way to pass temporary values between actions. Any value placed in flash will be available in the next action and then deleted.

At #12, if we do not successfully save Post to the database, we display an error message and render the new view again.

When the user clicks Save, the create method is called. create either updates the database with the save method, or returns an error. Unlike new, create does not have a corresponding view. create works behind the scenes to collect the data submitted by the user and update the database. create is a POST action.

Run the specs for create and observe that all three POST create tests pass:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'POST create'
Use the form on http://localhost:3000/posts/new to create a post. You will be redirected to the, as of yet, unfinished posts show page.

#### Styling the New View
Now that new and create are implemented, we can style the corresponding view with Bootstrap:

app/views/posts/new.html.erb
```
 <%= form_for @post do |f| %>
   <%= f.label :title %>
   <%= f.text_field :title %>
 
   <%= f.label :body %>
   <%= f.text_area :body %>
 
   <%= f.submit "Save" %>
 <% end %>
 <h1>New Post</h1>
 
 <div class="row">
   <div class="col-md-4">
     <p>Guidelines for posts</p>
     <ul>
       <li>Make sure it rhymes.</li>
       <li>Don't use the letter "A".</li>
       <li>The incessant use of hashtags will get you banned.</li>
     </ul>
   </div>
   <div class="col-md-8">
     <%= form_for @post do |f| %>
       <div class="form-group">
 # #13
         <%= f.label :title %>
 # #14
         <%= f.text_field :title, class: 'form-control', placeholder: "Enter post title" %>
       </div>
       <div class="form-group">
         <%= f.label :body %>
         <%= f.text_area :body, rows: 8, class: 'form-control', placeholder: "Enter post body" %>
       </div>
       <div class="form-group">
 # #15
         <%= f.submit "Save", class: 'btn btn-success' %>
       </div>
     <% end %>
   </div>
 </div>
 ```
At #13, we use f.label to display title. This functionality is provided by form_for, which yields a form builder object that, in turn, provides f.label. f.label, in turn, creates an HTML <label> tag for the object that is specified. In this case it will be:

<label for="post_title">Title</label>
At #14, f.text_field is another method that FormHelper provides and creates an  <input> tag of type text. It will yield:

<input class="form-control" placeholder="Enter post title" type="text" name="post[title]" id="post_title">
At #15, f.submit yields an input tag of type submit. It will yield:

 <input type="submit" name="commit" value="Save" class="btn btn-success">
Refresh http://localhost:3000/posts/new to see your changes. Then use the form to create a new post.

#### Displaying the Flash Message
When you create a post, no success message is displayed. This is because, while we're placing a value into flash, we're not displaying it in the view yet. Because every view may have a flash message at some point, we'll add it someplace universal. Let's add it to application.html.erb.

Open app/views/layouts/application.html.erb and add the flash code:

app/views/layouts/application.html.erb
```
 <!DOCTYPE html>
 <html>
   <head>
     <title>Bloccit</title>
     <%= csrf_meta_tags %>

     <meta name="viewport" content="width=device-width, initial-scale=1">
     <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
   </head>

   <body>
     <div class="container">
       <ul class="nav nav-tabs">
         <li><%= link_to "Bloccit", root_path %></li>
         <li><%= link_to "About", about_path %></li>
       </ul>

       <% if flash[:notice] %>
         <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
           <%= flash[:notice] %>
         </div>
       <% elsif flash[:alert] %>
         <div class="alert alert-warning">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
           <%= flash[:alert] %>
         </div>
       <% end %>


       <%= yield %>
     </div>
   </body>
 </html>
 ```
Create a post from http://localhost:3000/posts/new and we'll see a green flash message.

#### Reading Posts
We have the ability to create new posts, so a logical next step is to implement the ability to read them. Recall the CRUD acronym - "create read update delete"; we've completed "create" and are moving on to "read". First, let's write the tests:

spec/controllers/posts_controller_spec.rb
```
 ...

 #  describe "GET show" do
 #    it "returns http success" do
 #      get :show
 #      expect(response).to have_http_status(:success)
 #    end
 #  end
   describe "GET show" do
     it "returns http success" do
 # #16
       get :show, params: { id: my_post.id }
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
 # #17
       get :show, params: { id: my_post.id }
       expect(response).to render_template :show
     end
 
     it "assigns my_post to @post" do
       get :show, params: { id: my_post.id }
 # #18
       expect(assigns(:post)).to eq(my_post)
     end
   end

 ...

 end
 ```
At #16, we pass {id: my_post.id} to show as a parameter. These parameters are passed to the  params hash.

The params hash contains all parameters passed to the application's controller (application_controller.rb), whether from GET, POST, or any other HTTP action.

At #17, we expect the response to return the show view using the render_template matcher.

At #18, we expect the post to equal my_post because we call show with the id of  my_post. We are testing that the post returned to us is the post we asked for.

Run the spec:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'GET show'
We see that the first two tests pass, but the last one fails. Let's fix it by implementing  show:

app/controllers/posts_controller.rb
```
 class PostsController < ApplicationController
   def index
     @posts = Post.all
   end

   def show
 # #19
     @post = Post.find(params[:id])
   end

   def new
   end

   def edit
   end
 end
 ```
At #19, we find the post that corresponds to the id in the params that was passed to  show and assign it to @post. Unlike in the index method, in the show method, we populate an instance variable with a single post, rather than a collection of posts.

Run the spec again and see that our tests for show pass.

Open http://localhost:3000/posts and click on a post's link. We are taken to the show view, thanks to the link_to method. The show view still has boilerplate HTML code.

Let's view the params hash by adding this line:

app/views/posts/show.html.erb
 <h1>Posts#show</h1>
 <p>Find me in app/views/posts/show.html.erb</p>

 <%= params %>
When you refresh the page, you should see this:

{"action"=>"show", "controller"=>"posts", "id"=>"1"}
This hash communicates which action and controller was called. It also has the id of the post we clicked - it's encoded in the URL. In our controller, we accessed that id by calling params[:id], which, in the above case, returned "1". We then assigned the post found with that id to the @post variable.

Let's replace <%= params %> in app/views/posts/show.html.erb with some post-specific code:

app/views/posts/show.html.erb
```
 <h1>Posts#show</h1>
 <p>Find me in app/views/posts/show.html.erb</p>
 
 <%= params %>
 <h1><%= @post.title %></h1>
 <p><%= @post.body %></p>
 ```
Go back to the index view at http://localhost:3000/posts and click on a post. You should see an updated show view with data specific to the Post instance that was clicked.

### Updating and Deleting posts
Now that we can create and view posts, we'll implement the ability to edit and update them.

Create a new Git feature branch for this checkpoint. See Git Checkpoint Workflow: Before Each Checkpoint for details.

#### Editing and Updating Posts
To edit existing posts we'll need to implement two actions, edit and update. The  edit action uses the edit view to allow users to update an existing post. Just as the new view submits a form to the create action, the edit view submits a form to the  update action.

edit Action
Let's create the tests for edit:

spec/controllers/posts_controller_spec.rb
```
 ...
 #  describe "GET edit" do
 #    it "returns http success" do
 #      get :edit
 #      expect(response).to have_http_status(:success)
 #    end
 #  end
   describe "GET edit" do
     it "returns http success" do
       get :edit, params: { id: my_post.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, params: { id: my_post.id }
 # #1
       expect(response).to render_template :edit
     end
 
 # #2
     it "assigns post to be updated to @post" do
       get :edit, params: { id: my_post.id }
 
       post_instance = assigns(:post)
 
       expect(post_instance.id).to eq my_post.id
       expect(post_instance.title).to eq my_post.title
       expect(post_instance.body).to eq my_post.body
     end
   end
 ...
 ```
At #1, we expect the edit view to render when a post is edited.

At #2, we test that edit assigns the correct post to be updated to @post.

Run the edit specs:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'GET edit'
The first two tests pass because of the stubbed edit action in PostsController and Rails' default rendering. The last test fails because we haven't finished the edit action.

Modify the edit action:

app/controllers/posts_controller.rb
```
   def edit
     @post = Post.find(params[:id])
   end
   ```
Rerun the edit specs to confirm all three pass:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'GET edit'

#### update Action
With the edit action implemented and the specs passing, it's time to implement  update to receive the edited posts. Let's TDD update:

spec/controllers/posts_controller_spec.rb
```
 ...
   describe "PUT update" do
     it "updates post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
 
 # #3
       updated_post = assigns(:post)
       expect(updated_post.id).to eq my_post.id
       expect(updated_post.title).to eq new_title
       expect(updated_post.body).to eq new_body
     end
 
     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
 # #4
       put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
       expect(response).to redirect_to my_post
     end
   end
 ...
 ```
At #3, we test that @post was updated with the title and body passed to update. We also test that @post's id was not changed.

At #4, we expect to be redirected to the posts show view after the update.

Run the update specs.

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'PUT update'
These tests both fail because we haven't implemented the update action in  PostsController. Let's implement it:

app/controllers/posts_controller.rb
```
   def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
 
     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
   ```
Run the update tests and verify that they both pass:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'PUT update'

#### Edit and Update Views
Update the posts edit view to display a form that allows users to update posts:

app/views/posts/edit.html.erb
```
 <h1>Posts#edit</h1>
 <p>Find me in app/views/posts/edit.html.erb</p>
 <h1>Edit Post</h1>
 
 <div class="row">
   <div class="col-md-4">
     <p>Guidelines for posts</p>
     <ul>
       <li>Make sure it rhymes.</li>
       <li>Don't use the letter "A".</li>
       <li>The incessant use of hashtags will get you banned.</li>
     </ul>
   </div>
   <div class="col-md-8">
     <%= form_for @post do |f| %>
       <div class="form-group">
         <%= f.label :title %>
         <%= f.text_field :title, class: 'form-control', placeholder: "Enter post title" %>
       </div>
       <div class="form-group">
         <%= f.label :body %>
         <%= f.text_area :body, rows: 8, class: 'form-control', placeholder: "Enter post body" %>
       </div>
       <div class="form-group">
         <%= f.submit "Save", class: 'btn btn-success' %>
       </div>
     <% end %>
   </div>
 </div>
 ```
Let's add a link to edit a post on the show view:

app/views/posts/show.html.erb
```
 <h1><%= @post.title %></h1>
 <p><%= @post.body %></p>
 <h1><%= @post.title %></h1>
 
 <div class="row">
   <div class="col-md-8">
     <p><%= @post.body %></p>
   </div>
   <div class="col-md-4">
 <!-- #5 -->
     <%= link_to "Edit", edit_post_path(@post), class: 'btn btn-success' %>
   </div>
 </div>
 ```
At #5, we format a link as an Edit button which directs a user to  /posts/@post.id/edit.  edit_post_path(@post) is a helper method that is generated in  routes.rb by resources :posts. (Run rails routes from the command line to view the post routes, if you need a refresher.)

Open http://localhost:3000/posts, click on a post, edit, and save it.

#### Destroy
We should provide users with the ability to delete posts. Let's write the tests for the  Post#destroy action:

spec/controllers/posts_controller_spec.rb
```
...

   describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, params: { id: my_post.id }
 # #6
       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to posts index" do
       delete :destroy, params: { id: my_post.id }
 # #7
       expect(response).to redirect_to posts_path
     end
   end

...
```
At #6, we search the database for a post with an id equal to my_post.id. This returns an Array. We assign the size of the array to count, and we expect count to equal zero. This test asserts that the database won't have a matching post after destroy is called.

At #7, we expect to be redirected to the posts index view after a post has been deleted.

Run these tests and confirm they both fail because we haven't defined the destroy action yet:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb -e 'DELETE destroy'
Open PostsController and implement the destroy action to make the previous tests pass:

app/controllers/posts_controller.rb
```
...

   def destroy
     @post = Post.find(params[:id])
 
 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

...
```
At #8, we call destroy on @post. If that call is successful, we set a flash message and redirect the user to the posts index view. If destroy fails then we redirect the user to the show view using render :show.

Comments are dependent on a post's existence because of the has_many :comments declaration in Post. When we delete a post, we also need to delete all related comments. We'll perform a "cascade delete", which ensures that when a post is deleted, all of its comments are too. Let's modify Post to handle this:

app/models/post.rb
   has_many :comments
   has_many :comments, dependent: :destroy
Let's use link_to to add a link to delete posts on the show view:

app/views/posts/show.html.erb
```
 <h1><%= @post.title %></h1>

 <div class="row">
   <div class="col-md-8">
     <p><%= @post.body %></p>
   </div>
 <div class="col-md-4">
   <%= link_to "Edit", edit_post_path(@post), class: 'btn btn-success' %>
 <!-- #9 -->
   <%= link_to "Delete Post", @post, method: :delete, class: 'btn btn-danger', data: {confirm: 'Are you sure you want to delete this post?'} %>
   </div>
 </div>
 ```
At #9, we use link_to to create a delete button. The text on the button is Delete Post. We override the default method (:post) with :delete so that when the button is pressed the route called is the delete route. We style the button by setting class: to 'btn btn-danger'. We pass a Hash with the confirm: key to the data: argument. This confirms the action with a JavaScript confirmation dialog when a user presses the button.

We've built the functionality to create posts, but we don't have a way to organize them. We anticipate that Bloccit users will create a large number of posts, and will therefore need a way to organize, or categorize them.  we'll create a topics resource that will be used to organize posts. Along the way, we'll learn how to nest resources and refactor code.

Create a new Git feature branch for this checkpoint. 

## Topic Model
The first step in creating a new topic resource is to create a topic model. An instance of Topic will require a name and description attribute. We'll also create a public attribute, of a Boolean data type, to allow users to restrict access to topics.

### Create the topic model:

Terminal
```
$ rails generate model topic name:string public:boolean description:text
      invoke  active_record
      create    db/migrate/20150625221905_create_topics.rb
      create    app/models/topic.rb
      invoke    rspec
      create      spec/models/topic_spec.rb
      ```
Open the migration file and set the public attribute to true by default:

db/migrate/20150729181446_create_topics.rb
```
 class CreateTopics < ActiveRecord::Migration[5.0]
   def change
     create_table :topics do |t|
       t.string :name
       t.boolean :public
       t.boolean :public, default: true
       t.text :description

       t.timestamps
     end
   end
 end
 ```
Run the migration using rails db:migrate:

Terminal
$ rails db:migrate
Topic Specs
Add the following tests to topic_spec.rb:

spec/models/topic_spec.rb
```
 require 'rails_helper'

 RSpec.describe Topic, type: :model do
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:public) { true }
   let(:topic) { Topic.create!(name: name, description: description) }

 # #1
   describe "attributes" do
     it "has name, description, and public attributes" do
       expect(topic).to have_attributes(name: name, description: description, public: public)
     end

 # #2
     it "is public by default" do
       expect(topic.public).to be(true)
     end
   end
 end
 ```
At #1, we confirm that a topic responds to the appropriate attributes.

At #2, we confirm that the public attribute is set to true by default.

Run topic_spec.rb to confirm all four tests pass:

Terminal
$ rspec spec/models/topic_spec.rb
To organize posts by topic we will need to build an association between topics and posts. To TDD this association we'll use the Shoulda gem. Shoulda makes it easier for us to write association tests by providing some handy methods that RSpec doesn't have. Add Shoulda to Gemfile and run bundle install:

Gemfile
```
 group :development, :test do
   gem 'rspec-rails', '~> 3.0'
   gem 'rails-controller-testing'
   gem 'shoulda'
 end
 ```
Terminal
$ bundle install
Use methods provided by Shoulda and add the following tests to topic_spec.rb:

spec/models/topic_spec.rb
```
 require 'rails_helper'

 RSpec.describe Topic, type: :model do
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:public) { true }
   let(:topic) { Topic.create!(name: name, description: description) }

   it { is_expected.to have_many(:posts) }
 ...
 ```
Now add tests for post_spec.rb:

spec/models/post_spec.rb
```
 require 'rails_helper'

 RSpec.describe Post, type: :model do
   let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }
 # #3
   let(:topic) { Topic.create!(name: name, description: description) }
 # #4
   let(:post) { topic.posts.create!(title: title, body: body) }
 
   it { is_expected.to belong_to(:topic) }

   describe "attributes" do
     it "has a title and body attribute" do
       expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
       expect(post).to have_attributes(title: title, body: body)
     end
   end
 end
 ```
At #3, we create a parent topic for post.

At #4, we associate post with topic via topic.posts.create!. This is a chained method call which creates a post for a given topic.

Finally, we'll need to update comment_spec.rb to account for the new association:

spec/models/comment_spec.rb
```
 require 'rails_helper'

 RSpec.describe Comment, type: :model do
   let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
   let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

   describe "attributes" do
 ...
 ```
Run the spec and confirm that the test doesn't pass.

Run topic_spec.rb and post_spec.rb. There will be error messages for each spec because topics and posts are not associated. Let's fix these errors by creating the association.

#### Associations
Database tables are associated via foreign keys. 

topic_id foreign key

In the above association, Post.topic_id is a foreign_key that references Topic.id.

Because posts belong to topics, we'll add a topic_id foreign key attribute to the posts table:

Terminal
```
$ rails generate migration AddTopicToPosts topic_id:integer:index
      invoke  active_record
      create    db/migrate/20150729184746_add_topic_to_posts.rb
      ```
This generated the following migration file:

db/migrate/20150729184746_add_topic_to_posts.rb
```
class AddTopicToPosts < ActiveRecord::Migration
  def change
 # #5
    add_column :posts, :topic_id, :integer
 # #6
    add_index :posts, :topic_id
  end
end
```
At #5, we see that the name we gave the migration, AddTopicToPosts, is very important. 

At #6, we created an index on topic_id with the generator. An index improves the speed of operations on a database table.

You should always index your foreign key columns.

Run the migration to add the foreign key:

Terminal
$ rails db:migrate
Update Post and Topic to reflect the association:

app/models/post.rb
```
 class Post < ApplicationRecord
   belongs_to :topic
   has_many :comments, dependent: :destroy
 end
app/models/topic.rb
 class Topic < ApplicationRecord
   has_many :posts
 end
 ```
Run topic_spec.rb and post_spec.rb to confirm that all the tests are passing:

Terminal
$ rspec spec/models/topic_spec.rb
$ rspec spec/models/post_spec.rb
Seeds
We also need to update seeds.rb, because none of the posts in the database have an associated topic. Create some new topics and assign each post to a random topic:

db/seeds.rb
```
 # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 ```
Empty the existing database of posts and topics and reseed it with the reset command:

Terminal
$ rails db:reset
The Topics Resource
Our topics resource has a model, but not a controller. Let's generate a topics controller to complete our topics resource, as well as the necessary routes and views to present topics to users:

Terminal
$ rails generate controller Topics
We didn't pass any action arguments to the controller generator. Instead, we'll create the actions and views that topics require manually.

Build the resourceful routes:

config/routes.rb
```
 Rails.application.routes.draw do
   resources :topics
   resources :posts

   get 'about' => 'welcome#about'

   root 'welcome#index'
 end
 ```
Run rails routes from the command line to examine the routes we created for topics. resources creates the seven standard CRUD routes we need for topics.

#### Topics Index
As with PostsController, we'll TDD the actions in TopicsController, starting with the  index action:

spec/controllers/topics_controller_spec.rb
```
 require 'rails_helper'

 RSpec.describe TopicsController, type: :controller do
   let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
 
   describe "GET index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end
 
     it "assigns my_topic to @topics" do
       get :index
       expect(assigns(:topics)).to eq([my_topic])
     end
   end
 end
 ```
This test follows the pattern we established when testing PostsController. Using  let, we create a my_topic variable to use in our tests. We then write two tests to confirm the expected behavior of the index action.

Run the index section of the TopicsContollerSpec to confirm that both tests fail:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET index'
Add the index action to TopicsController and provide an array of topics to the index view to pass the tests:

app/controllers/topics_controller.rb
```
 class TopicsController < ApplicationController
   def index
     @topics = Topic.all
   end
 end
 ```
To pass the tests, we need to create the topics index view to display a list of all topics with their names and descriptions:

Terminal
$ touch app/views/topics/index.html.erb
With this view created, topics_controller_spec.rb will now pass both index tests:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET index'
Fill out the view to display a list of all topics:

app/views/topics/index.html.erb
```
 <h1>Topics</h1>
 
 <div class="row">
   <div class="col-md-8">
 <!-- #7 -->
     <% @topics.each do |topic| %>
       <div class="media">
         <div class="media-body">
           <h4 class="media-heading">
 <!-- #8 -->
             <%= link_to topic.name, topic %>
           </h4>
           <small>
             <%= topic.description %>
           </small>
         </div>
       </div>
     <% end %>
   </div>
   <div class="col-md-4">
 <!-- #9 -->
     <%= link_to "New Topic", new_topic_path, class: 'btn btn-success' %>
   </div>
 </div>
 ```
At #7, we loop over each topic in @topics.

At #8, we create a link to the show view for each topic.

At #9, we create a link to create a new topic.

Visit http://localhost:3000/topics. You should see the topics that were created in  seeds.rb and a New Topic button.

#### Show Topic
When a user clicks on a topic, they should be taken to its show view and shown the posts that belong to that topic.

Add tests for the topic show action:

spec/controllers/topics_controller_spec.rb
```
 ...
   describe "GET show" do
     it "returns http success" do
       get :show, params: { id: my_topic.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, params: { id: my_topic.id }
       expect(response).to render_template :show
     end
 
     it "assigns my_topic to @topic" do
       get :show, params: { id: my_topic.id }
       expect(assigns(:topic)).to eq(my_topic)
     end
   end
 end
 ```
These three tests should fail:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET show'
Update TopicsController to add a show action

app/controllers/topics_controller.rb
```
 class TopicsController < ApplicationController
   def index
     @topics = Topic.all
   end
 
   def show
     @topic = Topic.find(params[:id])
   end
 end
 ```
Our tests will still fail because of the missing show view, so we'll create that view next:

Terminal
$ touch app/views/topics/show.html.erb
With the show view created, topics_controller_spec.rb will now pass all three show tests:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET show'
Fill out the view to display the topic information and all associated posts:

app/views/topics/show.html.erb
```
 <h1><%= @topic.name %></h1>
 
 <%= link_to "Edit Topic", edit_topic_path, class: 'btn btn-success' %>
 
 <div class="row">
   <div class="col-md-8">
     <p class="lead"><%= @topic.description %></p>
 <!-- #10 -->
     <% @topic.posts.each do |post| %>
       <div class="media">
         <div class="media-body">
           <h4 class="media-heading">
             <%= link_to post.title, post %>
           </h4>
         </div>
       </div>
     <% end %>
   </div>
   <div class="col-md-4">
     <%= link_to "New Post", new_post_path(@topic), class: 'btn btn-success' %>
   </div>
 </div>
 ```
At #10, we iterate over the posts belonging to @topic, and display each post.

Open http://localhost:3000/topics and click on a topic to confirm that the topic show view works as expected.

#### New Topics
Users will want to be able to create new topics, so let's implement the new and  create actions using TDD.

new Action
Add tests for the new action:

spec/controllers/topics_controller_spec.rb
```
 ...
   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end
 
     it "initializes @topic" do
       get :new
       expect(assigns(:topic)).not_to be_nil
     end
   end
 end
 ```
The three new tests will fail because TopicsController doesn't implement the new action yet:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET new'
Implement the new action:

app/controllers/topics_controller.rb
```
 class TopicsController < ApplicationController
   def index
     @topics = Topic.all
   end

   def show
     @topic = Topic.find(params[:id])
   end
 
   def new
     @topic = Topic.new
   end
 end
 ```
Our tests are still failing because of the missing new view, so let's create it now:

Terminal
$ touch app/views/topics/new.html.erb
With the new view created, topics_controller_spec.rb will now pass all three new tests:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET new'
Add a form for creating new topics:

app/views/topics/new.html.erb
```
 <h1>New Topic</h1>
 
 <div class="row">
   <div class="col-md-4">
     <p>Guidelines for topics:</p>
     <ul>
       <li>Make sure the topic is appropriate.</li>
       <li>Never insult dogs.</li>
       <li>Smile when you type.</li>
     </ul>
   </div>
   <div class="col-md-8">
     <%= form_for @topic do |f| %>
       <div class="form-group">
         <%= f.label :name %>
         <%= f.text_field :name, class: 'form-control', placeholder: "Enter topic name" %>
       </div>
       <div class="form-group">
         <%= f.label :description %>
         <%= f.text_area :description, rows: 8, class: 'form-control', placeholder: "Enter topic description" %>
       </div>
       <div class="form-group">
         <%= f.label :public, class: 'checkbox' do %>
           <%= f.check_box :public %> Public topic
         <% end %>
       </div>
       <%= f.submit "Save", class: 'btn btn-success' %>
     <% end %>
   </div>
 </div>
 ``
Open http://localhost:3000/topics/new and click on the New Topic button to confirm that the topic new view looks as expected.

The user interface (UI) for creating new topics is complete, but if we try to submit the form, we'll get an error. This is because we haven't implemented the create action, which is used for inserting new records into the database.

#### create Action
Add three tests for create:

spec/controllers/topics_controller_spec.rb
```
 ...
   describe "POST create" do
     it "increases the number of topics by 1" do
       expect{ post :create, params: { topic: { name: RandomData.random_sentence, description: RandomData.random_paragraph } } }.to change(Topic,:count).by(1)
     end
 
     it "assigns Topic.last to @topic" do
       post :create, params: { topic: { name: RandomData.random_sentence, description: RandomData.random_paragraph } }
       expect(assigns(:topic)).to eq Topic.last
     end
 
     it "redirects to the new topic" do
       post :create, params: { topic: { name: RandomData.random_sentence, description: RandomData.random_paragraph } }
       expect(response).to redirect_to Topic.last
     end
   end
 end
 ```
Run these tests and confirm that they're failing:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'POST create'
Pass these tests by implementing the create action:

app/controllers/topics_controller.rb
```
 class TopicsController < ApplicationController
   def index
     @topics = Topic.all
   end

   def show
     @topic = Topic.find(params[:id])
   end

   def new
     @topic = Topic.new
   end
 
   def create
     @topic = Topic.new
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end
 end
 ```
The create tests in topics_controller_spec.rb should now pass:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'POST create'
Create a couple of new topics in your browser to confirm that new and create work as expected.

#### Edit Topic
Implement the edit and update actions so users can edit existing topics, starting with edit.

edit Action
Let's TDD the edit action first:

spec/controllers/topics_controller_spec.rb
```
 ...
   describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_topic.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_topic.id}
       expect(response).to render_template :edit
     end
 
     it "assigns topic to be updated to @topic" do
       get :edit, {id: my_topic.id}
       topic_instance = assigns(:topic)
 
       expect(topic_instance.id).to eq my_topic.id
       expect(topic_instance.name).to eq my_topic.name
       expect(topic_instance.description).to eq my_topic.description
     end
   end
 end
 ```
These tests will fail until we implement the edit action:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET edit'
Implement the edit action:

app/controllers/topics_controller.rb
```
 class TopicsController < ApplicationController
 ...
 
   def edit
     @topic = Topic.find(params[:id])
   end
 
 end
 ```
Our tests are still failing because of the missing edit view:

Terminal
$ touch app/views/topics/edit.html.erb
topics_controller_spec.rb will now pass all three edit tests:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'GET edit'
Update the edit view to give users the ability to update a topic's name, description, and public attributes:

app/views/topics/edit.html.erb
```
 <h1>Edit Topic</h1>
 
 <div class="row">
   <div class="col-md-4">
     <p>Guidelines for topics:</p>
     <ul>
       <li>Make sure the topic is appropriate.</li>
       <li>Never insult dogs.</li>
       <li>Smile when you type.</li>
     </ul>
   </div>
   <div class="col-md-8">
     <%= form_for @topic do |f| %>
       <div class="form-group">
         <%= f.label :name %>
         <%= f.text_field :name, class: 'form-control', placeholder: "Enter topic name" %>
       </div>
       <div class="form-group">
         <%= f.label :description %>
         <%= f.text_area :description, rows: 8, class: 'form-control', placeholder: "Enter topic description" %>
       </div>
       <div class="form-group">
 <!-- #11 -->
         <%= f.label :public, class: 'checkbox' do %>
           <%= f.check_box :public %> Public topic
         <% end %>
       </div>
       <%= f.submit "Save", class: 'btn btn-success' %>
     <% end %>
   </div>
 </div>
 ```
At #11, we pass a block to f.label to generate the HTML for a checkbox.

From http://localhost:3000/topics click on a topic and the click the Edit Topic button to confirm that the topic edit view and form look as expected.

#### update Action
Let's create the ability to update a topic's database record by implementing the  update action. Add three tests for update:

spec/controllers/topics_controller_spec.rb
```
 ...
   describe "PUT update" do
     it "updates topic with expected attributes" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, params: { id: my_topic.id, topic: { name: new_name, description: new_description } }
 
       updated_topic = assigns(:topic)
       expect(updated_topic.id).to eq my_topic.id
       expect(updated_topic.name).to eq new_name
       expect(updated_topic.description).to eq new_description
     end
 
     it "redirects to the updated topic" do
       new_name = RandomData.random_sentence
       new_description = RandomData.random_paragraph
 
       put :update, params: { id: my_topic.id, topic: { name: new_name, description: new_description } }
       expect(response).to redirect_to my_topic
     end
   end
 end
 ```
Run these tests and confirm that they fail:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'PUT update'
Pass the tests by implementing the update action:

app/controllers/topics_controller.rb
```
 class TopicsController < ApplicationController
  ...
 
   def update
     @topic = Topic.find(params[:id])
 
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
     if @topic.save
        flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
   end
 
 end
 ```
The update tests in topics_controller_spec.rb should now pass:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'PUT update'
Edit some topics in your browser to confirm that the edit and update work as expected.

#### Delete Topic
Users may want to delete topics, so we'll implement destroy using TDD:

spec/controllers/topics_controller_spec.rb
```
 ...
   describe "DELETE destroy" do
     it "deletes the topic" do
       delete :destroy, params { id: my_topic.id }
       count = Post.where({id: my_topic.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to topics index" do
       delete :destroy, params: { id: my_topic.id }
       expect(response).to redirect_to topics_path
     end
   end
 end
 ```
Run these tests:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'DELETE destroy'
They'll both fail until we implement destroy:

app/controllers/topics_controller.rb
```
...
   def destroy
     @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
   end
 end
 ```
redirect_to action: :index is the same as redirect_to topics_path because  topics_path routes to the index action per Rails' resourceful routing.

Our tests should now pass:

Terminal
$ rspec spec/controllers/topics_controller_spec.rb -e 'DELETE destroy'
Update the show view to display a Delete Topic button:

app/views/topics/show.html.erb
```
 <h1><%= @topic.name %></h1>

 <%= link_to "Edit Topic", edit_topic_path, class: 'btn btn-success' %>
 <%= link_to "Delete Topic", @topic, method: :delete, class: 'btn btn-danger', data: { confirm: 'Are you sure you want to delete this topic?' } %>
 ...
 ```
When we delete a topic, its associated posts should also be deleted:

models/topic.rb
```
 class Topic < ApplicationRecord
   has_many :posts
   has_many :posts, dependent: :destroy
 end
 ```
Because comments already depend on posts, they will also be deleted when a topic is deleted.

Visit http://localhost:3000/topics and click on a topic and make sure you can delete it.

### Nesting Posts
Nesting is a term we use when one object should be interacted with in the exclusive context of another object. Associated models, like posts and topics, don't need to be nested, but we should nest posts in topics because we never want posts to be viewed, created, or edited in isolation. A nested post's URL will be scoped to topic, for example: /topics/1/posts/3. This URL still meets RESTful conventions, and is supported by Rails.

To nest posts under topics, we'll need to refactor routes.rb, the PostsController, and the topic and post views. Before we refactor, let's update our tests in anticipation of our nested posts:

spec/controllers/posts_controller_spec.rb
```
 require 'rails_helper'

 RSpec.describe PostsController do
 # #12
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
 # #13
   let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

   let(:my_post) { Post.create( title:  RandomData.random_sentence, body:   RandomData.random_paragraph) }

 # #14
   describe "GET index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end
 
     it "assigns [my_post] to @posts" do
       get :index
       expect(assigns(:posts)).to eq([my_post])
     end
   end
   ```
Because posts will be nested under topics, at #12 we create a parent topic named  my_topic.

At #13, we update how we create my_post so that it will belong to my_topic.

At #14, we remove the index tests. Posts will no longer need an index view because they'll be displayed on the show view of their parent topic.

spec/controllers/posts_controller_spec.rb
```
   describe "GET show" do
     it "returns http success" do
       get :show, params: { id: my_post.id }
 # #15
       get :show, params: { topic_id: my_topic.id, id: my_post.id }
       expect(response).to have_http_status(:success)
     end

     it "renders the #show view" do
       get :show, params: { id: my_post.id }
 # #16
       get :show, params: { topic_id: my_topic.id, id: my_post.id }
       expect(response).to render_template :show
     end

     it "assigns my_post to @post" do
       get :show, params: { id: my_post.id }
 # #17
       get :show, params: { topic_id: my_topic.id, id: my_post.id }
       expect(assigns(:post)).to eq(my_post)
     end
   end
   ```
Posts routes will now include the topic_id of the parent topic, so at #15, #16, and #17 we update our get :show request to include the id of the parent topic.

spec/controllers/posts_controller_spec.rb
```
   describe "GET new" do
     it "returns http success" do
       get :new
 # #18
       get :new, params: { topic_id: my_topic.id }
       expect(response).to have_http_status(:success)
     end

     it "renders the #new view" do
       get :new
 # #19
       get :new, params: { topic_id: my_topic.id }
       expect(response).to render_template :new
     end

     it "initializes @post" do
       get :new
# #20
       get :new, params: { topic_id: my_topic.id }
       expect(assigns(:post)).not_to be_nil
     end
   end
   ```
At #18, #19, and #20 we update the get :new request to include the id of the parent topic.

spec/controllers/posts_controller_spec.rb
```
   describe "POST create" do
     it "increases the number of Post by 1" do
       expect{ post :create, params: { post: {title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
 # #21
       expect{ post :create, params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
     end

     it "assigns the new post to @post" do
       post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
 # #22
       post :create, params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
       expect(assigns(:post)).to eq Post.last
     end

     it "redirects to the new post" do
       post :create, params: { post: { name: RandomData.random_sentence, body: RandomData.random_paragraph } }
       expect(response).to redirect_to Post.last
 # #23
       post :create, params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
 # #24
       expect(response).to redirect_to [my_topic, Post.last]
     end
   end
   ```
At #21, #22, and #23 we update the post :create request to include the id of the parent topic.

At #24, because the route for the posts show view will also be updated to reflect nested posts, instead of redirecting to Post.last, we redirect to  [my_topic, Post.last]. Rails' router can take an array of objects and build a route to the show page of the last object in the array, nesting it under the other objects in the array.

spec/controllers/posts_controller_spec.rb
```
   describe "GET edit" do
     it "returns http success" do
       get :edit, params: { id: my_post.id }
 # #25
       get :edit, params: { topic_id: my_topic.id, id: my_post.id }
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, params: { id: my_post.id }
 # #26
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to render_template :edit
     end

     it "assigns post to be updated to @post" do
       get :edit, params: { id: my_post.id }
 # #27
       get :edit, params: { topic_id: my_topic.id, id: my_post.id }
       post_instance = assigns(:post)

       expect(post_instance.id).to eq my_post.id
       expect(post_instance.title).to eq my_post.title
       expect(post_instance.body).to eq my_post.body
     end
   end
   ```
At #25, #26, and #27 we update the get :edit request to include the id of the parent topic.

spec/controllers/posts_controller_spec.rb
```
   describe "PUT update" do
     it "updates post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
 # #28
       put :update, params: { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body } }

       updated_post = assigns(:post)
       expect(updated_post.id).to eq my_post.id
       expect(updated_post.title).to eq new_title
       expect(updated_post.body).to eq new_body
     end

     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, params: { id: my_post.id, post: { title: new_title, body: new_body } }
       expect(response).to redirect_to my_post
 # #29
       put :update, params: { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body } }
 # #30
       expect(response).to redirect_to [my_topic, my_post]
     end
   end
   ```
At #28 and #29 we update the put :update request to include the id of the parent topic.

At #30, we replace redirect_to my_post with redirect_to [my_topic, my_post] so that we'll be redirected to the posts show view after we nest posts.

spec/controllers/posts_controller_spec.rb
```
   describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, params: { id: my_post.id }
 # #31
       delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end

     it "redirects to posts index" do
       delete :destroy, params: { id: my_post.id }
       expect(response).to redirect_to posts_path
     it "redirects to topic show" do
 # #32
       delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
 # #33
       expect(response).to redirect_to my_topic
     end
   end
 end
 ```
At #31 and #32 we update the delete :destroy request to include the id of the parent topic.

At #33, we want to be redirected to the topics show view instead of the posts index view.

With our tests ready, let's update routes.rb to nest posts:

config/routes.rb
```
 Rails.application.routes.draw do

   resources :topics
   resources :posts
   resources :topics do
 # #34
     resources :posts, except: [:index]
   end

   get 'about' => 'welcome#about'

   root 'welcome#index'
 end
 ```
At #34 we pass resources :posts to the resources :topics block. This nests the post routes under the topic routes.

Examine the new post routes:

Terminal
$ rails routes | grep post
             topic_posts POST   /topics/:topic_id/posts(.:format)          posts#create
          new_topic_post GET    /topics/:topic_id/posts/new(.:format)      posts#new
         edit_topic_post GET    /topics/:topic_id/posts/:id/edit(.:format) posts#edit
              topic_post GET    /topics/:topic_id/posts/:id(.:format)      posts#show
                         PATCH  /topics/:topic_id/posts/:id(.:format)      posts#update
                         PUT    /topics/:topic_id/posts/:id(.:format)      posts#update
                         DELETE /topics/:topic_id/posts/:id(.:format)      posts#destroy
As you can see in the output above, all post URLs are now scoped to a topic.

There's no longer an index route for posts. This is because the posts index view is no longer needed. All posts will be displayed with respect to a topic now, on the topics show view. Remove the index action from the PostsController:

app/controllers/posts_controller.rb
```
 class PostsController < ApplicationController
   def index
     @posts = Post.all
   end
 ...
 ```
Remove app/views/posts/index.html.erb and stage the removal:

Terminal
$ git rm app/views/posts/index.html.erb
Run the tests and we'll see seven failures, caused by the PostsController:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb
...
16 examples, 7 failures
Let's implement the code to pass the tests:

app/controllers/posts_controller.rb
```
 class PostsController < ApplicationController
   def show
     @post = Post.find(params[:id])
   end

   def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
   end

   def create
     @post = Post.new
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
     @topic = Topic.find(params[:topic_id])
 # #35
     @post.topic = @topic

     if @post.save
       flash[:notice] = "Post was saved."
 # #36
       redirect_to @post
       redirect_to [@topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end

   def edit
     @post = Post.find(params[:id])
   end

   def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]

     if @post.save
       flash[:notice] = "Post was updated."
 # #37
       redirect_to @post
       redirect_to [@post.topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   def destroy
     @post = Post.find(params[:id])

     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
 # #38
        redirect_to posts_path
        redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end
 end
 ```
At #35 we assign a topic to a post.

At #36 and #37 we change the redirect to use the nested post path.

At #38, when a post is deleted, we direct users to the topic show view.

With PostsController updated to reflect our nested routes, all the tests in  posts_controller_spec.rb should pass. Run the tests again to confirm and then we'll proceed to updating our views:

Terminal
$ rspec spec/controllers/posts_controller_spec.rb
#### Refactor the Topics Show View
The topic show view includes a button that links to new_post_path(@post). As the rails output shows, new_post_path is no longer available. (In fact, if you visit a topic's show view, you'll see a NoMethodError complaining about this.) We need to replace the old method with new_topic_post_path to reflect the nested route we generated in  routes.rb:

app/views/topics/show.html.erb
```
 <h1><%= @topic.name %></h1>

 <%= link_to "Edit Topic", edit_topic_path, class: 'btn btn-success' %>
 <%= link_to "Delete Topic", @topic, method: :delete, class: 'btn btn-danger', data: { confirm: 'Are you sure you want to delete this topic?' } %>

 <div class="row">
   <div class="col-md-8">
     <p class="lead"><%= @topic.description %></p>
     <% @topic.posts.each do |post| %>
       <div class="media">
         <div class="media-body">
           <h4 class="media-heading">
 <!-- #39 -->
             <%= link_to post.title, post %>
             <%= link_to post.title, topic_post_path(@topic, post) %>
           </h4>
 <!-- #40 -->
           <small>
             submitted <%= time_ago_in_words(post.created_at) %> ago <br>
             <%= post.comments.count %> Comments
           </small>
         </div>
       </div>
     <% end %>
   </div>
   <div class="col-md-4">
 <!-- #41 -->
     <%= link_to "New Post", new_post_path(@topic), class: 'btn btn-success' %>
     <%= link_to "New Post", new_topic_post_path(@topic), class: 'btn btn-success' %>
     <%= link_to "Delete Topic", @topic, method: :delete, class: 'btn btn-danger', data: { confirm: 'Are you sure you want to delete this topic?' } %>
   </div>
 </div>
 ```
At #39, we refactor how we link to individual posts using the topic_post_path method. This helper takes a topic and a post and generates a path to the posts show view.

At #40, we add submission and comment details for each post in the show view.

At #41, we replace new_post_path with new_topic_post_path to reflect the nested route we generated in routes.rb.

Visit a topic's show view, and confirm that there is no longer an error.

#### Refactor the Posts Show View
Each link in the topic show view contains a properly nested and RESTful URL for its associated posts. Click on one of the links to an individual post, and you'll see an  Undefined Method edit_post_path error.

app/views/posts/show.html.erb
```
 <h1><%= @post.title %></h1>

 <div class="row">
   <div class="col-md-8">
     <p><%= @post.body %></p>
   </div>
   <div class="col-md-4">
     <%= link_to "Edit", edit_post_path(@post), class: 'btn btn-success' %>
     <%= link_to "Delete Post", @post, method: :delete, class: 'btn btn-danger', data: { confirm: 'Are you sure you want to delete this post?' } %>
 // #42
     <%= link_to "Edit", edit_topic_post_path(@post.topic, @post), class: 'btn btn-success' %>
 // #43
     <%= link_to "Delete Post", [@post.topic, @post], method: :delete, class: 'btn btn-danger', data: { confirm: 'Are you sure you want to delete this post?' } %>
   </div>
 </div>
 ```
At #42, we replace edit_post_path with edit_topic_post_path, which takes two arguments, a topic and a post.

At #43, we update link_to to take an array consisting of a topic and post, which it uses to build the link to delete a nested post.

Refresh the post show view and the error should be resolved because we used valid methods to generate the URLs for the Edit and Delete Post buttons.

#### Refactor the Posts Edit and New Views
If you click on the Edit button in the post show view, you'll get another undefined method error. This is because form_for uses similar path conventions as link_to. You've learned how to fix this with the link_to method, and we'll use the same approach for form_for:

app/views/posts/edit.html.erb
```
 ...
     <%= form_for @post do |f| %>
     <%= form_for [@post.topic, @post] do |f| %>
 ...
 ```
app/views/posts/new.html.erb
```
     <%= form_for @post do |f| %>
     <%= form_for [@topic, @post] do |f| %>
     ```
Just like link_to, form_for can take an array of objects instead of a single object to generate the correct paths for nested resources.

Refresh the posts edit view to confirm that we've resolved the error.

Top Notch Topics
The topics index view is the gateway to our application, so we should give users an easy way to access it from any page by updating application.html.erb:

app/views/layouts/application.html.erb
```
 <!DOCTYPE html>
 <html>
 <head>
   <title>Bloccit</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
   <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
   <%= csrf_meta_tags %>
 </head>
 <body>
   <div class="container">
     <ul class="nav nav-tabs">
       <li><%= link_to "Bloccit", root_path %></li>
       <li><%= link_to "Topics", topics_path %></li>
       <li><%= link_to "About", about_path %></li>
 ...
        ```
Visit any page in Bloccit we'll see a link to our topics index view. Create, update, and delete some topics and posts to confirm that everything is working as expected.
        
 ### Validation Specs
Let's validate the Post model with the following rules. An instance of Post must:

1. have a title, body, and topic
1. have at least five characters in the title
1. have at least 20 characters in the body
1. There are numerous types of validations. The most common are presence,  length, and format. The Rails Guide on validations is a good reference to keep bookmarked.

Add the following tests to post_spec.rb:

spec/models/post_spec.rb
```
 ...
   it { is_expected.to belong_to(:topic) }

   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_presence_of(:topic) }
 
   it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it { is_expected.to validate_length_of(:body).is_at_least(20) }
 
   describe "attributes" do
     it "has title and body attributes" do
       expect(post).to have_attributes(title: title, body: body)
 ...
 ```
At #1, we test that Post validates the presence of title, body, and topic. At #2, we test that Post validates the lengths of title and body.

Run post_spec.rb to see that the five new tests fail:

Terminal
$ rspec spec/models/post_spec.rb
### Validating Posts
Add the validations tested above to Post using the validates method:

app/models/post.rb
```
 class Post < ApplicationRecord
   belongs_to :topic
   has_many :comments, dependent: :destroy

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
 end
 ```
Run post_spec.rb again to confirm that our validations satisfy our tests:

Terminal
$ rspec spec/models/post_spec.rb
### Validations in Action
Examine how these validations work by opening the Rails console and creating a new  Post object:

Restart the console if it's already running.
```
Console
$ rails c
>> my_post = Post.new
=> #<Post id: nil, title: nil, body: nil, created_at: nil, updated_at: nil, topic_id: nil>
Check to see if my_post is valid:

Console
>> my_post.valid?
=> false
Print the errors that make my_post invalid:

Console
>> my_post.errors
=> #<ActiveModel::Errors:0x007fad729366c0 @base=#<Post id: nil, title: nil, body: nil, created_at: nil, updated_at: nil, topic_id: nil>, @messages={:title=>["is too short (minimum is 5 characters)", "can't be blank"], :body=>["is too short (minimum is 20 characters)", "can't be blank"], :topic=>["can't be blank"]}>
Print the complete error messages:

Console
>> my_post.errors.full_messages
=> ["Title is too short (minimum is 5 characters)", "Title can't be blank", "Body is too short (minimum is 20 characters)", "Body can't be blank", "Topic can't be blank"]
Print the :title error:

Console
>> my_post.errors[:title]
=> ["is too short (minimum is 5 characters)", "can't be blank"]
Since my_post was created without values, it didn't meet the conditions we validate in  Post. If you try to save it, the method will return false and fail to save. If you call the  save! method on the post, it will throw an error.

Remember what ! does?

Console
> my_post.save!
   (0.1ms)  begin transaction
   (0.1ms)  rollback transaction
ActiveRecord::RecordInvalid: Validation failed: Title is too short (minimum is 5 characters), Title can't be blank, Body is too short (minimum is 20 characters), Body can't be blank, Topic can't be blank
```

#### Displaying Validation Errors
Let's change our post views to display errors raised by our validations. Because these changes will affect the forms on both the new and the edit views, it's a good time to demonstrate how to use partials to make our views DRY.

Open the edit view and make the following changes:

app/views/posts/edit.html.erb
```
 <h1>Edit Post</h1>

 <div class="row">
   <div class="col-md-4">
     <p>Guidelines for posts</p>
     <ul>
       <li>Make sure it rhymes.</li>
       <li>Don't use the letter "A".</li>
       <li>The incessant use of hashtags will get you banned.</li>
     </ul>
   </div>
 <div class="col-md-8">
     <%= form_for [@post.topic, @post] do |f| %>
       <div class="form-group">
         <%= f.label :title %>
         <%= f.text_field :title, class: 'form-control', placeholder: "Enter post title" %>
       </div>
       <div class="form-group">
         <%= f.label :body %>
         <%= f.text_area :body, rows: 8, class: 'form-control', placeholder: "Enter post body" %>
       </div>
       <div class="form-group">
         <%= f.submit "Save", class: 'btn btn-success' %>
       </div>
     <% end %>
     <%= render partial: 'form', locals: { topic: @post.topic, post: @post } %>
   </div>
 </div>
 ```
We just replaced a large chunk of code with a partial. Partials are fragments of view code, which are called from views. Partials are called with the render method. Rendering a partial is like copying and pasting view code from another file.

We've rendered a partial in the edit view, but this partial file doesn't yet exist. We need to create the partial and add the code we just removed from the edit view.

Why remove code from one view file, just to paste it in another? Partials make our code DRYer, clearer, and more modular.

Form Partial
Create a new file in app/views/posts named _form.html.erb. The underscore at the beginning of a file name lets Rails know that it's a partial. Add the code we deleted from the edit view to _form.html.erb:

app/views/posts/_form.html.erb
```
 <!-- #3 -->
 <%= form_for [topic, post] do |f| %>
   <div class="form-group">
     <%= f.label :title %>
      <%= f.text_field :title, class: 'form-control', placeholder: "Enter post title" %>
   </div>
   <div class="form-group">
     <%= f.label :body %>
     <%= f.text_area :body, rows: 8, class: 'form-control', placeholder: "Enter post body" %>
   </div>
   <div class="form-group">
     <%= f.submit "Save", class: 'btn btn-success' %>
   </div>
 <% end %>
 ```
At #3 we use the topic and post local variables we passed into the partial when we rendered it:

app/views/posts/edit.html.erb
    <%= render partial: 'form', locals: { topic: @post.topic, post: @post } %>
Our view is called _form.html.erb, while we render the partial: 'form'. This is a Rails convention for partial naming. If we don't follow it, the partial will not be found.

locals: { topic: @post.topic, post: @post } passes local variables to the partial.  @post.topic and @post are assigned to topic and post, respectively. This means we can refer to these local variables, rather than the @post instance variable we used in the edit view.

Although the partial does have access to @post, it's a better practice to use local variables. A primary reason is flexibility. We want to be able to render our partial on any page, whether or not it has access to the same instance variables.

Start the Rails server, navigate to the edit view, and make sure no errors appear. If the partial worked, the edit view should appear as it did before the refactor. The great thing about partials is that they're reusable. The form for creating new posts is the same as the form for editing, so let's refactor the new view next.

#### Refactor the Posts New View
Open the posts new view and make the following changes:

app/views/posts/new.html.erb
```
 <h1>New Post</h1>

 <div class="row">

   <div class="col-md-4">

     <p>Guidelines for posts</p>
     <ul>
       <li>Make sure it rhymes.</li>
       <li>Don't use the letter "A".</li>
       <li>The incessant use of hashtags will get you banned.</li>
     </ul>
   </div>

   <div class="col-md-8">
 <%= render partial: 'form', locals: { topic: @topic, post: @post } %>
   </div>
 </div>
 ```

Visit the new view and validate that it looks the same as it did prior to the refactor.

### The Application Helper
Styling the elements on the form partial is a little tricky. If the form displays errors, we want a certain style, and if the form doesn't display errors, we want a different style. We could include conditional logic directly in our view, but Rails conventions strongly suggest keeping as much logic as possible out of the view. Views cluttered with if statements are hard to read, hard to maintain, and confusing. We'll use the  ApplicationHelper to implement a DRY solution for toggling the div classes we'll need to display an error-full or error-less view.

Methods in ApplicationHelper can be used across our application. It's a Module that Rails includes with other classes in our app. Any public method we write in  ApplicationHelper will be available in all views.

Open app/helpers/application_helper.rb and add the following code:

app/helpers/application_helper.rb
```
 module ApplicationHelper
 # #4
   def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?
# #5
     content_tag :div, capture(&block), class: css_class
   end
 end
 ```
At #4, we define a method named form_group_tag which takes two arguments. The first argument is an array of errors, and the second is a block.

The & turns the block into a Proc, which we've seen before but haven't named. A Proc is a block that can be reused like a variable.

At #5, the content_tag helper method is called. This method is used to build the HTML and CSS to display the form element and any associated errors.

Helpers are written in Ruby and usually return HTML. The content_tag is one such method. It takes a symbol argument, a block, and an options hash. It then creates the symbol-specified HTML tag with the block contents, and if specified, the options.

We need a different div based on the errors raised by the validates method, so let's use form_group_tag in the form partial:

app/view/posts/_form.html.erb
```
 <%= form_for [topic, post] do |f| %>
   <div class="form-group">
   <% if post.errors.any? %>
 # #6
     <div class="alert alert-danger">
 # #7
       <h4><%= pluralize(post.errors.count, "error") %>.</h4>
       <ul>
         <% post.errors.full_messages.each do |msg| %>
           <li><%= msg %></li>
         <% end %>
       </ul>
     </div>
   <% end %>
  # #8
   <%= form_group_tag(post.errors[:title]) do %>
     <%= f.label :title %>
     <%= f.text_field :title, class: 'form-control', placeholder: "Enter post title" %>
   </div>
   <div class="form-group">
   <% end %>
  # #9
   <%= form_group_tag(post.errors[:body]) do %>
     <%= f.label :body %>
     <%= f.text_area :body, rows: 8, class: 'form-control', placeholder: "Enter post body" %>
   </div>
   <% end %>
   <div class="form-group">
     <%= f.submit "Save", class: 'btn btn-success' %>
   </div>
 <% end %>
 ```
At #6, if there are any validation errors, we display an alert with the number of errors and their messages. At #7, we use the pluralize method to pluralize "error" if there is more than one error. At #8, we use form_group_tag to display title errors. At #9, we use form_group_tag to display body errors.

Open the post new view and submit a new post with no title or body. Validate that you see the correctly formatted error messages. Also submit a new post with a valid  title and body to ensure that, given valid inputs, a user can successfully create a new post.
        
## Authentication -User Model
User authentication systems determine whether a user is who they claim to be. They allow users to sign up, sign in, and sign out. We'll build the foundation of Bloccit's user authentication system by creating the User model.

### Custom Authentication
There are some popular authentication systems for Rails, including Devise, OmniAuth, and AuthLogic. While these systems offer robust functionality, building our own solution will give us a deeper understanding of authentication-based models, controllers, and routing.

### Generate User
Before we build authentication functionality, we'll need a user to authenticate. Generate a User model to represent the users of Bloccit with the following attributes:

#### Attribute	Description
name	A string to represent the user's name.
email	A string to represent the user's email.
password_digest	A string to store the user's hashed password.

Terminal
$ rails generate model User name:string email:string password_digest:string
Run the migration:

Terminal
$ rails db:migrate
When we migrate the database, we are ultimately changing the database's schema, which describes the layout, structure, and contents of the database. Open  db/schema.rb and review the schema.

schema.rb serves two important purposes. It represents the current state of the database, which can be difficult to deduce from the migration files. It also populates the database schema before tests are executed.

#### Test User
Let's write our first specs for User:

spec/models/user_spec.rb
```
 require 'rails_helper'

 RSpec.describe User, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
   # Shoulda tests for name
   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }
 
   # Shoulda tests for email
   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("user@bloccit.com").for(:email) }
 
   # Shoulda tests for password
   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }
 
   describe "attributes" do
     it "should have name and email attributes" do
       expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
     end
   end
 end
 ```
As with our other model tests, the tests above test for field validation and attributes. Let's simulate and add tests for an invalid user:

spec/models/user_spec.rb
```
...

 # #1
   describe "invalid user" do
     let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
     let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
 
     it "should be an invalid user due to blank name" do
       expect(user_with_invalid_name).to_not be_valid
     end
 
     it "should be an invalid user due to blank email" do
       expect(user_with_invalid_email).to_not be_valid
     end
 
   end
 end
 ```
At #1, we wrote a test that does not follow the same conventions as our previous tests. We are testing for a value that we know should be invalid. We call this a true negative, as we are testing for a value that shouldn't exist. A true positive follows the reciprocal pattern and tests for a known and valid value. True negatives are a useful testing strategy, because if we only test for values that we know should exist, we may not catch values that shouldn't.

Run the tests, and we'll see 14 failures:

Terminal
$ rspec spec/models/user_spec.rb
User Model
Let's add the functionality we just tested for in user_spec.rb:

app/models/user.rb
```
 class User < ApplicationRecord
 # #2
   before_save { self.email = email.downcase if email.present? }

 # #3
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #4
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
 # #5
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

 # #6
   has_secure_password
 end
 ```
At #2, we register an inline callback directly after the before_save callback.  { self.email = email.downcase } is the code that will run when the callback executes.

At #3, we use Ruby's validates function to ensure that name is present and has a maximum and minimum length.

At #4, we validate password with two separate validations:

The first validation executes if password_digest is nil. This ensures that when we create a new user, they have a valid password.
The second validation ensures that when updating a user's password, the updated password is also six characters long. allow_blank: true skips the validation if no updated password is given. This allows us to change other attributes on a user without being forced to set the password.
At #5, we validate that email is present, unique, case insensitive, has a minimum length, has a maximum length, and that it is a properly formatted email address.

At #6, we use Ruby's has_secure_password. has_secure_password "adds methods to set and authenticate against a BCrypt password. This mechanism requires you to have a password_digest attribute". This function abstracts away much of the complexity of obfuscating user passwords using hashing algorithms which we would otherwise be inclined to write to securely save passwords. has_secure_password requires a password_digest attribute on the model it is applied to.  has_secure_password creates two virtual attributes, password and  password_confirmation that we use to set and save the password.

To use has_secure_password, we need to install BCrypt. BCrypt is a module that encapsulates complex hashing algorithms. BCrypt takes a plain text password and turns it into an unrecognizable string of characters using a hashing algorithm such as MD5. Typically, hashing algorithms are one directional so that if someone gains access to the hashed password, they will not be able to reverse the hashing algorithm to gain the plaintext password. This way, our password is safe even if someone gains access to our database.

Let's add BCrypt to our Gemfile. Add it to the bottom of the Gemfile, outside of any blocks:

Gemfile
```
...

gem 'bootstrap-sass'

 # Used for encrypting passwords
 gem 'bcrypt'

...
```
As usual after adding a gem to the Gemfile, we need to install it:

Terminal
$ bundle install

...
Let's run our specs again:

Terminal
$ rspec spec/models/user_spec.rb
...............

Finished in 0.111 seconds (files took 1.41 seconds to load)
15 examples, 0 failures
Our specs now pass and we are in the green phase of TDD. We still need to add user routes though:

config/routes.rb
```
...
   resources :topics do
     resources :posts, except: [:index]
   end

 # #7
   resources :users, only: [:new, :create]

...
```
At #7, we create routes for new and create actions. The only hash key will prevent Rails from creating unnecessary routes.

Run rails routes to see the user routes that were generated:

Terminal
$ rails routes | grep user
We're now able to represent and store users in our app.

## Authentication - Signing up
Bloccit has the ability to model and persist users, but we have no way of creating a user or signing up for the application. We'll implement sign up in this checkpoint.

### UsersController
To create users, we'll need a controller. Create the UsersController:

Terminal
$ rails generate controller Users
Start the Rails server and open localhost:3000/users/new. We see an error stating that "The action 'new' could not be found for UsersController". This is because we haven't created actions for UsersController and we don't have the proper routes in place. We'll write UsersController using TDD, as usual.

Add the following code in users_controller_spec.rb:

spec/controllers/users_controller_spec.rb
```
 require 'rails_helper'

 RSpec.describe UsersController, type: :controller do
 # #1
   let(:new_user_attributes) do
     {
         name: "BlocHead",
         email: "blochead@bloc.io",
         password: "blochead",
         password_confirmation: "blochead"
     }
   end
 end
 ```
At #1, we create a hash of attributes named new_user_attributes so we can use them easily throughout our spec.

#### new Action
spec/controllers/users_controller_spec.rb
```
 ...

 # #2
   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
 
     it "instantiates a new user" do
       get :new
       expect(assigns(:user)).to_not be_nil
     end
   end

 ...
 ```
At #2, we test the new action for HTTP success when issuing a GET. The first test expects the response to return an HTTP response code of 200. The second test expects new to instantiate a new user.

Run the spec, and see that we have two failing tests.

Terminal
$ rspec spec/controllers/users_controller_spec.rb
Let's write the implementation code for new and pass these tests:

app/controllers/users_controller.rb
```
 class UsersController < ApplicationController
   def new
     @user = User.new
   end
 end
 ```
Let's also create the new view:

terminal
$ touch app/views/users/new.html.erb
As before, we created an instance variable named @user to be used by the new view's form. Run the spec again and our two tests should pass:

Terminal
$ rspec spec/controllers/users_controller_spec.rb
#### create Action
create is the action that is called when the new view's form is submitted with valid attributes. Let's write the tests first:

spec/controllers/users_controller_spec.rb
```
 ...

 # #3
   describe "POST create" do
     it "returns an http redirect" do
       post :create, params: { user: new_user_attributes }
       expect(response).to have_http_status(:redirect)
     end
 
 # #4
     it "creates a new user" do
       expect{
         post :create, params: { user: new_user_attributes }
       }.to change(User, :count).by(1)
     end
 
 # #5
     it "sets user name properly" do
       post :create, params: { user: new_user_attributes }
       expect(assigns(:user).name).to eq new_user_attributes[:name]
     end
 
 # #6
     it "sets user email properly" do
       post :create, params: { user: new_user_attributes }
       expect(assigns(:user).email).to eq new_user_attributes[:email]
     end
 
 # #7
     it "sets user password properly" do
       post :create, params: { user: new_user_attributes }
       expect(assigns(:user).password).to eq new_user_attributes[:password]
     end
 
 # #8
     it "sets user password_confirmation properly" do
       post :create, params: { user: new_user_attributes }
       expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
     end
   end
 end
 ```
At #3, we test the create action for HTTP success when issuing a POST with  new_user_attributes set as the params hash.

At #4, we test that the database count on the users table increases by one when we issue a POST to create.

At #5, we test that we set user.name properly when creating a user.

At #6, we test that we set user.email properly when creating a user.

At #7, we test that we set user.password properly when creating a user.

At #8, we test that we set user.password_confirmation properly when creating a user.

Run the spec to see the six new failures:

Terminal
$ rspec spec/controllers/users_controller_spec.rb
Let's pass these tests by updating UsersController with a create action:

app/controllers/users_controller.rb
```
 class UsersController < ApplicationController
   def new
     @user = User.new
   end

   def create
 # #9
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
 
 # #10
     if @user.save
       flash[:notice] = "Welcome to Bloccit #{@user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end

 end
 ```
At #9, we create a new user with new and then set the corresponding attributes from the params hash.

At #10, we save the new user to the database. If the database save is successful, we add a flash message and then redirect the user to the root path. Otherwise, we display an error and render the new view.

Run the spec again and our six tests pass.

Remember that we already created new and create routes in the previous checkpoint, so we do not need to modify routes.rb at this point, as we have done in the past with other controllers.

HTML
Let's build the views for creating users. Open the users new view and add the following:

app/views/users/new.html.erb
```
 <h2>Sign up</h2>
 
 <div class="row">
   <div class="col-md-8">
     <%= form_for @user do |f| %>
 <!-- #11 -->
       <% if @user.errors.any? %>
         <div class="alert alert-danger">
           <h4><%= pluralize(@user.errors.count, "error") %>.</h4>
           <ul>
             <% @user.errors.full_messages.each do |msg| %>
               <li><%= msg %></li>
             <% end %>
           </ul>
         </div>
       <% end %>
 <!-- #12 -->
       <%= form_group_tag(@user.errors[:name]) do %>
         <%= f.label :name %>
         <%= f.text_field :name, autofocus: true, class: 'form-control', placeholder: "Enter name" %>
       <% end %>
       <%= form_group_tag(@user.errors[:email]) do %>
         <%= f.label :email %>
         <%= f.email_field :email, class: 'form-control', placeholder: "Enter email" %>
       <% end %>
       <%= form_group_tag(@user.errors[:password]) do %>
         <%= f.label :password %>
         <%= f.password_field :password, class: 'form-control', placeholder: "Enter password" %>
       <% end %>
       <%= form_group_tag(@user.errors[:password_confirmation]) do %>
         <%= f.label :password_confirmation %>
         <%= f.password_field :password_confirmation, class: 'form-control', placeholder: "Enter password confirmation" %>
       <% end %>
       <div class="form-group">
         <%= f.submit "Sign up", class: 'btn btn-success' %>
       </div>
     <% end %>
   </div>
 </div>
 ```
At #11, we check the errors hash on @user. The errors hash is provided by  ActiveModel:Errors. If there are errors with @user, such as invalid attributes, we display the corresponding error messages.

At #12, we add form fields for name and email, as well as the virtual attributes provided by has_secure_password: password and password_confirmation.

It's been a while since we updated our home page. Let's use this opportunity to enhance the home page with an improved design and a call-to-action for signing up:

app/views/welcome/index.html.erb
```
 <h1>Welcome to Bloccit</h1>
 <p id="index-title">This is the home page for Bloccit.</p>
 <div class="posts">Post 1 goes here.</div>
 <div class="posts">Post 2 goes here.</div>
 <section>I am the content in a section element.</section>
 <div class="jumbotron">
   <h1>Bloccit</h1>
   <p>Bloccit is a resource for sharing links with your friends!</p>
   <p>
     <%= link_to "Sign Up", new_user_path, class: 'btn btn-primary' %> today!
   </p>
 </div>
 
 <div class="row">
   <div class="col-md-4">
     <h2>Solves world hunger</h2>
     <p>Bloccit will deliver food and water to those in need, all over the world.</p>
   </div>
   <div class="col-md-4">
     <h2>Eliminates poverty</h2>
     <p>Bloccit will deliver money and education to those in need, all over the world.</p>
   </div>
   <div class="col-md-4">
     <h2>Makes you better looking</h2>
     <p>Bloccit will make you better looking: it's scientifically proven to make men look like Ryan Gosling and women look like Shakira.</p>
   </div>
 </div>
 ```
Let's also add a Sign Up link to the top navigation:

app/views/layouts/application.html.erb
```
...

   <ul class="nav nav-tabs">
     <li><%= link_to "Bloccit", root_path %></li>
     <li><%= link_to "Topics", topics_path %></li>
     <li><%= link_to "About", about_path %></li>
     <li class="pull-right"><%= link_to "Sign Up", new_user_path %></li>
  </ul>

  <% if flash[:notice] %>

...
```
Try creating valid and invalid users. Your results should look similar to the images below. First for a valid user:

Successful User Creation
... and if you try to create an invalid user, with a mismatching Password and Password Confirmation:


