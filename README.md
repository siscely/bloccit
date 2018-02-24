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

View the index and about pages. The content between the <h1> tags should be red now. There are a few important things to note about the code above:

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
