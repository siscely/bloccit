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

 #  describe "GET show" do
 #    it "returns http success" do
 #      get :show
 #      expect(response).to have_http_status(:success)
 #    end
 #  end

 # describe "GET new" do
 #   it "returns http success" do
 #     get :new
 #     expect(response).to have_http_status(:success)
 #   end
 # end

 #  describe "GET edit" do
 #    it "returns http success" do
 #      get :edit
 #      expect(response).to have_http_status(:success)
 #    end
 #  end

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
