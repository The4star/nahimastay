# README
## Contributors
|[![Clinton Forster](./docs/clinton.jpg)] https://github.com/The4Star|
[![Emma Cullen](./docs/emma.jpg)] https://github.com/|
[![Kristy Lake](./docs/kristy.jpg)] https://github.com/klps007|

|-----------------|---------------|-------------|
| Clinton Forster | Emma Cullen   | Kristy Lake |

### Links

URL - 
GitHub - https://github.com/nahimastay

### Section 1 - Description
### Section 2 - Design Documents
### Section 3 - Planning Process
### Section 4 - Short question answers

# SECTION 1 - DESCRIPTION

### Purpose

"Nahimastay" is reciprocal couch surfing application built with Ruby on Rails providing users a two sided marketplace allowing users to search, book, leave reviews and earn kalma coins as both host and guest.

Users have the option of a paid "premium" membership which allows them to make unlimited enquires otherwise enquires are limited to 2 per day.

Karma coins

### Functionality / features

### Tech Stack

Front-end: HTML, ERB, CSS, Sass, Javascript
Back-end: Ruby, Ruby on Rails
Database: PostgreSQL Database with ActiveRecord
Deployment: Heroku

### Configuration / Installation Instructions

In the terminal:

1. Copy and paste the following into the terminal where you want to install:

  	git clone git@github.com:The4star/nahimastay.git

2. change into the file:

    cd  nahimastay/

3. Input the following in terminal this will open postgres:
   	
    psql postgres

4. Then copy and paste the following: 

 	create role nahimastay with createdb login password '123456';

5. Exit out of progress back to terminal by entering:

     \q

6. Now input this to terminal

    rails db:create

7. And start the server with:

    rails s

8. Open browser and put the following in the address bar:

    localhost3000

### Site Map

This is our sitemap 

[![Site Map for Nahimastay](./docs/sitemap.jpeg)] 

### Screenshots

Screenshots - Front End

[![Screenshot of Log in Page](./docs/fess1.jpeg)] 

Screenshots - Back End

[![Screenshot of Backend](./docs/bess1.jpeg)]
[![Screenshot of Backend](./docs/bess2.jpeg)] 
[![Screenshot of Backend](./docs/bess3.jpeg)] 

## SECTION 2 - DESIGN DOCUMENTATION 

### Design process

[![Color pallet](./docs/colorscheme.jpeg)]
[![Font combination](./docs/fontcombo.jng)] 

### A workflow diagram of the user journey/s.
 
 This is our workflow diagram of the users journey

[![Workflow diagram of the user journey](./docs/sitemap.jpeg)] 

### Database Entity Relationship Diagrams
 
 This is our database entity relationship diagram

[![Database entity relationship diagram](./docs/erd.jpeg)] 

## SECTION 3 - PLANNING PROCESS 

### Project plan & timeline

This is our initial project plan 

[![Project Plan](./docs/projectplan.png)] 

### Screenshots of Trello board(s)
 Trello board

[![Trello Board Screen Shot](./docs/trello1.png)] 
[![Trello Board Screen Shot](./docs/trello2.png)] 

## SECTION 4 - Short Answer Questions (Section 2.2)

### 1. What is the need (i.e. challenge) that you will be addressing in your project?

### 2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

### 3. Describe the project will you be conducting and how. your App will address the needs.

### 4. Describe the network infrastructure the App may be based on.

### 5. Identify and describe the software to be used in your App.

### 6. Identify the database to be used in your App and provide a justification for your choice.

Postgresql

### 7. Identify and describe the production database setup (i.e. postgres instance).

### 8. Describe the architecture of your App.

### 9. Explain the different high-level components (abstractions) in your App.

MODEL - 

VIEW - 

CONTROLLER - 

ACTIVE RECORD - 

### 10.  Detail any third party services that your App will use.

Key Gems / Modules:

Font 
Devise: User Authentication module used to manage user registration, sign-in, passwords, confirmation etc
AWS / Active Storage: Used to host uploaded images on Amazon Web Services

Services:

S3 Module: Image Storage from Amazon Web Services
Stripe: Payment processing Software as a Service (SASS) from Stripe. Allows users to pay for products or services within the app using credit card.

Full List of Dependencies:

### 11.Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

Airbnb

### 12. Discuss the database relations to be implemented.

We used the following datatbase relations one role has many Users, User has one profile, one role one accommodation review and one guest review , many stays, many messages and many accommodation types. On the other side of these relationships accommodation has one user, many stays, one accommodation review and many accommodation types with accommodation type having one accommodation. Stay belongs to and has one user, one accommodation review, one guest review and many messages

### 13. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

User:
    belongs_to_and_has_one :user
    has_many :messages
    has_many :accommodation_types through :accommodation
    has_one :accommodation_review
    has_one :guest_review

Profile:
    belongs_to_and_has_one :user

Role:
    has_many :users

Accommodation:
    has_one :user
    has_many :stays
    has_many :accommodation_types
    has_one :accommodation_review through :stay 

Accommodation type:
    has_one :accommodation 

Accommodation Review:
    has_one :stay

Stay:
    belongs_to_and_has_one :user
    has_many :messages
    has_many :accommodation_types through :accommodation
    has_one :accommodation_review
    has_one :guest_review

Guest Review:
    has_one :stay

Message:
    has_one :stay


### 14. Provide your database schema design.
 
 This is our database schema design

[![Database schema design](./docs/erd.jpeg)]


### 15. Provide User stories for your App.

"As a Guest (User who is not signed in), I should be able to ..."

* View the Home Page, read about the app's purpose and it's basic            functionality
* Search for accommodation by Country, City and dates 
* View host reviews
* Create new Account using email and password
* View options for paid membership

"As a Standard Member (Non-Paying User), I should be able to ..."

* Login and create a Profile, write a bio, provide personal details,         select membership type, and upload an optional avatar photo 
* Edit my profile at any time
* Use a default profile avatar photo
* Switch easily between host and guest profiles
* View all previous current and future stays
* View all previous, current and future guests
* Write a review for completed stays
* Write a review for guests after there stay
* Edit or cancel any (and only) stays or guests
* Edit / Delete and (and only) reviews I created
* Send up to 2 accommodation requests per day
* Have the option to upgrade membership
* Have the option to cancel membership
* Have the option to deactivate my account

"As a Premium Member (Paying User), I should be able to ..."

* Login and create a Profile, write a bio, provide personal details,         select membership type, and upload an optional avatar photo 
* Edit my profile at any time
* Use a default profile avatar photo
* Switch easily between host and guest profiles
* View all previous current and future stays
* View all previous, current and future guests
* Write a review for completed stays
* Write a review for guests after there stay
* Edit or cancel any (and only) stays or guests
* Edit / Delete and (and only) reviews I created
* Send unlimited accommodation requests per day
* Have the option to cancel membership
* Have the option to deactivate my account

"As an Administrator User, I should be able to ..."

* Edit / Delete content, including reviews and user inputed data
* View an Administrator Dashboard
* View all profiles 
* View financial data

### 16. Provide Wireframes for your App.

 These are our wireframes

[![Wireframe for Stay and Stay Show pages](./docs/wireframe1.jpeg)] 
[![Wireframe for Profile and Accommodation pages](./docs/wireframe2.jpeg)]
[![Wireframe for Home page and Search results](./docs/wireframe3.jpeg)] 



### 17. Describe the way tasks are allocated and tracked in your project.

Trello

[![Trello screenshot of Team Git Process](./docs/trelloteams1.jpeg)] 



### 18. Discuss how Agile methodology is being implemented in your project.

### 19. Provide an overview and description of your Source control process.

### 20. Provide an overview and description of your Testing process.

### 21. Discuss and analyse requirements related to information system security.

### 22. Discuss methods you will use to protect information and data.

### 23. Research what your legal obligations are in relation to handling user data.






