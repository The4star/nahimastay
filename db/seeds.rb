# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
Guestreview.delete_all
Accommodationreview.delete_all
Message.delete_all
Stay.delete_all
Accommodation.delete_all
Profile.delete_all
User.delete_all
Role.delete_all
Accomtype.delete_all


roles = [
    {
        privilege: "Admin"
    },
    {
        privilege: "Standard Member"
    },
    {
        privilege: "Premium Member"
    }
]
roles.each do |role|
    Role.create! role
end

accommodation_types = [
    {
        name: "Single Bed Private Room",
        description: "Single Bed in a private room",
        cost: 200
    },
    {
        name: "Double Bed Private Room",
        description: "Double Bed in a private room",
        cost: 225
    },
    {
        name: "Single Bed Shared Room",
        description: "Single Bed in a room with others",
        cost: 150
    },
    {
        name: "Double Bed Shared Room",
        description: "Single Bed in a room with others",
        cost: 175
    },
    {
        name: "Fold Cut Couch",
        description: "Fold out couch in a room with others",
        cost: 100
    },
    {
        name: "Sofa",
        description: "Sleep space available on a sofa in a shared space",
        cost: 50
    }
]
accommodation_types.each do |accom|
    Accomtype.create(accom)
end

rogerryan = User.create! :email => 'rogerryan@gmail.com', :password => '123456', :password_confirmation => '123456'
emmacullen = User.create! :email => 'emmacullen@gmail.com', :password => '123456', :password_confirmation => '123456'
johnsmith = User.create! :email => 'johnsmith@gmail.com', :password => '123456', :password_confirmation => '123456'
lucyjones = User.create! :email => 'lucyjones@gmail.com', :password => '123456', :password_confirmation => '123456'
haleypuppet = User.create! :email => 'haleypuppet@gmail.com', :password => '123456', :password_confirmation => '123456'
emilybrown = User.create! :email => 'emilybrown@gmail.com', :password => '123456', :password_confirmation => '123456'
nathanvuillard = User.create! :email => 'nathanvuillard@gmail.com', :password => '123456', :password_confirmation => '123456'
harrypatter = User.create! :email => 'harrypatter@gmail.com', :password => '123456', :password_confirmation => '123456'
ryandavidson = User.create! :email => 'ryandavidson@gmail.com', :password => '123456', :password_confirmation => '123456'
samcullen = User.create! :email => 'samcullen@gmail.com', :password => '123456', :password_confirmation => '123456'
fawnsimone = User.create! :email => 'fawnsimone@gmail.com', :password => '123456', :password_confirmation => '123456'
jasonderulo = User.create! :email => 'jasonderulo@gmail.com', :password => '123456', :password_confirmation => '123456'
davidmuller = User.create! :email => 'davidmuller@gmail.com', :password => '123456', :password_confirmation => '123456'
harrisonwhitely = User.create! :email => 'harrisonwhitely@gmail.com', :password => '123456', :password_confirmation => '123456'
harrymuller = User.create! :email => 'harrymuller@gmail.com', :password => '123456', :password_confirmation => '123456'
danieldeheer = User.create! :email => 'danieldeheer@gmail.com', :password => '123456', :password_confirmation => '123456'
samanthareid = User.create! :email => 'samanthareid@gmail.com', :password => '123456', :password_confirmation => '123456'
matthewmcloughlin = User.create! :email => 'matthewmcloughlin@gmail.com', :password => '123456', :password_confirmation => '123456'


profileemilybrown = Profile.where(user_id: emilybrown.id).first
profileemilybrown.update :first_name => 'Emily', :last_name => 'Brown', :bio => "Hi am a truck driver in my mid 40's, single and my favourite footy team is Collingwood and i love country music", :user_id => emilybrown.id, :created_at => Time.now, :karma_coins => 200, :host_rating => 0, :guest_rating => 0

path = Rails.root.join("app", "assets", "images", "family.jpg")
profileemilybrown.uploaded_image.attach(io: File.open(path), filename: "family.jpg")

profilerogerryan = Profile.where(user_id: rogerryan).first
profilerogerryan.update :first_name => 'Roger', :last_name => 'Ryan', :bio => "Hi i am a virgo, i enjoy cooking, music and movies", :user_id => rogerryan.id, :created_at => Time.now, :karma_coins => 1000, :host_rating => 0, :guest_rating => 0

path = Rails.root.join("app", "assets", "images", "groupboy.jpg")
profilerogerryan.uploaded_image.attach(io: File.open(path), filename: "groupboy.jpg")

profileemmacullen = Profile.where(user_id: emmacullen).first 
profileemmacullen.update :first_name => 'Emma', :last_name => 'Cullen', :bio => "Hi i am a full time student and i enjoy reading, wine and ballet", :user_id => emmacullen.id, :created_at => Time.now, :karma_coins => 1000, :host_rating => 0, :guest_rating => 0

path = Rails.root.join("app", "assets", "images", "girl.jpg")
profileemmacullen.uploaded_image.attach(io: File.open(path), filename: "girl.jpg")

profilejohnsmith = Profile.where(user_id: johnsmith).first 
profilejohnsmith.update :first_name => 'John', :last_name => 'Smith', :bio => "Hi i am a full time orthodontist and i enjoy skiing and opera", :user_id => johnsmith.id, :created_at => Time.now, :karma_coins => 1000, :host_rating => 4, :guest_rating => 4

path = Rails.root.join("app", "assets", "images", "manandgf.jpg")
profilejohnsmith.uploaded_image.attach(io: File.open(path), filename: "manandgf.jpg")

profilelucyjones = Profile.where(user_id: lucyjones).first 
profilelucyjones.update :first_name => 'Emma', :last_name => 'Cullen', :bio => "Hi i am full a time student and i enjoy reading, wine and ballet", :user_id => lucyjones.id, :created_at => Time.now, :karma_coins => 1000, :host_rating => 8, :guest_rating => 8

path = Rails.root.join("app", "assets", "images", "girl2.jpg")
profilelucyjones.uploaded_image.attach(io: File.open(path), filename: "girl2.jpg")

profilehaleypuppet = Profile.where(user_id: haleypuppet).first 
profilehaleypuppet.update :first_name => 'Hayley', :last_name => 'Puppet', :bio => "Hi i am a full time student and i enjoy reading, wine and ballet", :user_id => haleypuppet.id, :created_at => Time.now, :karma_coins => 1000, :host_rating => 5, :guest_rating => 5

path = Rails.root.join("app", "assets", "images", "girl.jpg")
profilehaleypuppet.uploaded_image.attach(io: File.open(path), filename: "girl.jpg")


# Accommodations
accommodationjohnsmith = Accommodation.create! :date_created => Time.now, :name => 'Beachside Home ', :description => "A spacious house near the beach", :country => "Australia", :city => "Melbourne", :address => "51 Blessington Street", :host_id => johnsmith.id, :accommodation_rating => 3, :available_start_date => Time.now, :available_end_date => Time.now, :accomtype_id => Accomtype.find(1).id

path = Rails.root.join("app", "assets", "images", "cottage.jpg")
accommodationjohnsmith.hero_image.attach(io: File.open(path), filename: "cottage.jpg")

accommodationlucyjones = Accommodation.create! :date_created => Time.now, :name => 'Beautiful Appartment', :description => "A luxurious apartment in the city", :country => "Australia", :city => "Melbourne", :address => "8 Boondara Grove", :host_id => lucyjones.id, :accommodation_rating => 3, :available_start_date => Time.now, :available_end_date => Time.now, :accomtype_id => Accomtype.find(1).id

path = Rails.root.join("app", "assets", "images", "house.jpeg")
accommodationlucyjones.hero_image.attach(io: File.open(path), filename: "house.jpeg")

accommodationhaleypuppet = Accommodation.create! :date_created => Time.now, :name => 'Homestay Appartment', :description => "A small, well-kept apartment in the city", :country => "Australia", :city => "Sydney", :address => "99 York St", :host_id => haleypuppet.id, :accommodation_rating => 5, :available_start_date => Time.now, :available_end_date => Time.now, :accomtype_id => Accomtype.find(1).id


path = Rails.root.join("app", "assets", "images", "smallapart.jpeg")
accommodationhaleypuppet.hero_image.attach(io: File.open(path), filename: "smallapart.jpeg")

#  Stays

haleypuppetstaysatlucyjones = Stay.create! :created_at => Time.now, :accommodation_id => accommodationlucyjones.id, :start_date => DateTime.parse("24/06/2019").to_date, :end_date => DateTime.parse("06/06/2019").to_date, :guest_id => haleypuppet.id, :confirmed => true, :rejected => false

johnsmithstaysatlucyjones = Stay.create! :created_at => Time.now, :accommodation_id => accommodationlucyjones.id, :start_date => DateTime.parse("01/06/2019").to_date, :end_date => DateTime.parse("21/06/2019").to_date, :guest_id => johnsmith.id, :confirmed => true, :rejected => false

lucyjonesstaysatjohnsmith = Stay.create! :created_at => Time.now, :accommodation_id => accommodationjohnsmith.id, :start_date => DateTime.parse("24/06/2019").to_date, :end_date => DateTime.parse("08/09/2019").to_date, :guest_id => lucyjones.id, :confirmed => true, :rejected => false

haleypuppetstaysatjohnsmith = Stay.create! :created_at => Time.now, :accommodation_id => accommodationjohnsmith.id, :start_date => DateTime.parse("24/06/2019").to_date, :end_date => DateTime.parse("08/09/2019").to_date, :guest_id => haleypuppet.id, :confirmed => true, :rejected => false

johnsmithstaysathaleypuppet = Stay.create! :created_at => Time.now, :accommodation_id => accommodationhaleypuppet.id, :start_date => DateTime.parse("24/09/2019").to_date, :end_date => DateTime.parse("06/10/2019").to_date, :guest_id => johnsmith.id, :confirmed => true, :rejected => false

lucyjonesstaysathaleypuppet = Stay.create! :created_at => Time.now, :accommodation_id => accommodationhaleypuppet.id, :start_date => DateTime.parse("24/09/2019").to_date, :end_date => DateTime.parse("06/10/2019").to_date, :guest_id => lucyjones.id, :confirmed => true, :rejected => false

# Accommodation Reviews
# Guest Reviews
# Messages
#         created_at: Time.now,
#         content: "Can i stay forever",
#         stay_id: Stay.find(2).id,
#         user_id: user_without_accom.id


#  Old seed file

# user_with_profile = User.create! :email => 'rogerryanuserwithprofile@example.com', :password => '123456', :password_confirmation => '123456'
# user_without_profile = User.create! :email => 'userwithoutprofile@example.com', :password => '123456', :password_confirmation => '123456'
# user_with_accom = User.create! :email => 'johnsmithuserwithaccom@example.com', :password => '123456', :password_confirmation => '123456'
# user_without_accom = User.create! :email => 'lucyjonesuserwithoutaccom@example.com', :password => '123456', :password_confirmation => '123456'
# admin_user = User.create! :email => 'adminhaleypuppet@example.com', :password => '123456', :password_confirmation => '123456'
# admin_user.role = Role.find(1)

# profiles = [
#     {
#         first_name: "Roger",
#         last_name: "Ryan",
#         bio: "I am Roger Ryan",
#         user_id: user_with_profile.id,
#         created_at: Time.now,
#         karma_coins: 0,
#         host_rating: 0,
#         guest_rating: 0
#     },
#     {
#         first_name: "John",
#         last_name: "Smith",
#         bio: "I am John Smith",
#         user_id: user_with_accom.id,
#         created_at: Time.now,
#         karma_coins: 0,
#         host_rating: 0,
#         guest_rating: 0
#     },
#     {
#         first_name: "Lucy",
#         last_name: "Jones",
#         bio: "I am Lucy Jones",
#         user_id: user_without_accom.id,
#         created_at: Time.now,
#         karma_coins: 0,
#         host_rating: 0,
#         guest_rating: 0
#     },
#     {
#         first_name: "Haley",
#         last_name: "Puppet",
#         bio: "I am Haley Puppet",
#         user_id: admin_user.id,
#         created_at: Time.now,
#         karma_coins: 0,
#         host_rating: 0,
#         guest_rating: 0
#     }
# ]

# profiles.each do |profile|
#     user = User.find(profile[:user_id])
#     user_profile = Profile.where(user_id: user) 
#     user_profile.update(profile)
# end

# accommodations = [
#     {
#         date_created: Time.now,
#         name: "Rancho Relaxo",
#         description: "Very relaxing",
#         country: "Australia",
#         city: "Melbourne",
#         address: "8 Boondara Grove",
#         host_id: user_with_profile.id,
#         accommodation_rating: 0,
#         available_start_date: Time.now,
#         available_end_date: Time.now,
#         accomtype_id: Accomtype.find(1).id
#     },
#     {
#         date_created: Time.now,
#         name: "House of Pain",
#         description: "Very painful",
#         country: "Australia",
#         city: "Sydney",
#         address: "99 York St",
#         host_id: user_with_accom.id,
#         accommodation_rating: 0,
#         available_start_date: Time.now,
#         available_end_date: Time.now,
#         accomtype_id: Accomtype.find(2).id
#     },
#     {
#         date_created: Time.now,
#         name: "House of fun",
#         description: "Very fun",
#         country: "United Kingdom",
#         city: "London",
#         address: "32 Cumming Street",
#         host_id: admin_user.id,
#         accommodation_rating: 0,
#         available_start_date: Time.now,
#         available_end_date: Time.now,
#         accomtype_id: Accomtype.find(4).id
#     }
# ]

# accommodations.each do |accommodation|
#     Accommodation.create!(accommodation)
# end

# stays = [
#     {
#         created_at: Time.now,
#         accommodation_id: Accommodation.find(1).id,
#         start_date: DateTime.parse("24/06/2019").to_date,
#         end_date: DateTime.parse("06/06/2019").to_date,
#         guest_id: admin_user.id,
#         confirmed: true,
#         rejected: false,
#     },
#     {
#         created_at: Time.now,
#         accommodation_id: Accommodation.find(1).id,
#         start_date: DateTime.parse("13/09/2019").to_date,
#         end_date: DateTime.parse("15/09/2019").to_date,
#         guest_id: user_without_accom.id,
#         confirmed: true,
#         rejected: false,
#     },
#     {
#         created_at: Time.now,
#         accommodation_id: Accommodation.find(2).id,
#         start_date: DateTime.parse("10/07/2019").to_date,
#         end_date: DateTime.parse("15/07/2019").to_date,
#         guest_id: user_with_profile.id,
#         confirmed: true,
#         rejected: false,
#     },
#     {
#         created_at: Time.now,
#         accommodation_id: Accommodation.find(3).id,
#         start_date: DateTime.parse("15/10/2019").to_date,
#         end_date: DateTime.parse("20/10/2019").to_date,
#         guest_id: user_with_profile.id,
#         confirmed: true,
#         rejected: false,
#     }
# ]

# stays.each do |stay|
#     Stay.create!(stay)
# end

# messages = [
#     {
#         created_at: Time.now,
#         content: "Can i bring my dog",
#         stay_id: Stay.find(1).id,
#         user_id: user_without_accom.id
#     },
#     {
#         created_at: Time.now,
#         content: "no",
#         stay_id: Stay.find(1).id,
#         user_id: user_with_profile.id
#     },
#     {
#         created_at: Time.now,
#         content: "Can i stay forever",
#         stay_id: Stay.find(2).id,
#         user_id: user_without_accom.id
#     },
#     {
#         created_at: Time.now,
#         content: "no",
#         stay_id: Stay.find(2).id,
#         user_id: user_with_accom.id
#     }
# ]

# messages.each do |message|
#     Message.create!(message)
# end

# accommodation_reviews = [
#     {
#         created_at: Time.now,
#         communication_rating: 0,
#         location_rating: 0,
#         cleanliness_rating: 0,
#         ammenities_rating: 0,
#         host_rating: 0,
#         comments: "much very bad",
#         stay_id: Stay.find(1).id
#     },
#     {
#         created_at: Time.now,
#         communication_rating: 5,
#         location_rating: 5,
#         cleanliness_rating: 5,
#         ammenities_rating: 5,
#         host_rating: 5,
#         comments: "much very good",
#         stay_id: Stay.find(2).id
#     },
#     {
#         created_at: Time.now,
#         communication_rating: 3,
#         location_rating: 3,
#         cleanliness_rating: 3,
#         ammenities_rating: 3,
#         host_rating: 3,
#         comments: "much very good",
#         stay_id: Stay.find(3).id
#     },
#     {
#         created_at: Time.now,
#         communication_rating: 3,
#         location_rating: 5,
#         cleanliness_rating: 2,
#         ammenities_rating: 1,
#         host_rating: 1,
#         comments: "Very average",
#         stay_id: Stay.find(4).id
#     }
# ]

# accommodation_reviews.each do |accommodation_review|
#     Accommodationreview.create!(accommodation_review)
#     Stay.find(accommodation_review[:stay_id]).accommodation.host.profile.update_host_rating(accommodation_review[:host_rating])
#     Stay.find(accommodation_review[:stay_id]).accommodation.update_accommodation_rating(accommodation_review[:communication_rating],
#     accommodation_review[:location_rating],
#     accommodation_review[:cleanliness_rating],
#     accommodation_review[:ammenities_rating])
# end

# guest_reviews = [
#     {
#         created_at: Time.now,
#         communication_rating: 0,
#         ease_of_hosting_rating: 0,
#         cleanliness_rating: 0,
#         comments: "rude",
#         stay_id: Stay.find(1).id
#     },
#     {
#         created_at: Time.now,
#         communication_rating: 5,
#         ease_of_hosting_rating: 5,
#         cleanliness_rating: 5,
#         comments: "polite",
#         stay_id: Stay.find(2).id
#     },
#     {
#         created_at: Time.now,
#         communication_rating: 3,
#         ease_of_hosting_rating: 3,
#         cleanliness_rating: 3,
#         comments: "ok guest",
#         stay_id: Stay.find(3).id
#     },
#     {
#         created_at: Time.now,
#         communication_rating: 2,
#         ease_of_hosting_rating: 3,
#         cleanliness_rating: 4,
#         comments: "pretty good",
#         stay_id: Stay.find(4).id
#     }
# ]

# guest_reviews.each do |guest_review|
#     Guestreview.create!(guest_review)
# end