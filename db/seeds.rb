# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    Role.create(role)
end

accommodation_types = [
    {
        name: "Single Bed Private Room",
        description: "Single Bed in a private room",
        cost: 50
    },
    {
        name: "Double Bed Private Room",
        description: "Double Bed in a private room",
        cost: 50
    },
    {
        name: "Single Bed Shared Room",
        description: "Single Bed in a room with others",
        cost: 50
    },
    {
        name: "Double Bed Shared Room",
        description: "Single Bed in a room with others",
        cost: 50
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

user_with_profile = User.create! :email => 'userwithprofile@example.com', :password => '123456', :password_confirmation => '123456'
user_without_profile = User.create! :email => 'userwithoutprofile@example.com', :password => '123456', :password_confirmation => '123456'
user_with_accom = User.create! :email => 'userwithaccom@example.com', :password => '123456', :password_confirmation => '123456'
user_without_accom = User.create! :email => 'userwithoutaccom@example.com', :password => '123456', :password_confirmation => '123456'
admin_user = User.create! :email => 'adminuser@example.com', :password => '123456', :password_confirmation => '123456'
admin_user.role = Role.find(1)

profiles = [
    {
        first_name: "Roger",
        last_name: "Ryan",
        bio: "I am Roger Ryan",
        user_id: user_with_profile.id,
        created_at: Time.now,
        karma_coins: 0,
        host_rating: 0,
        guest_rating: 0
    },
    {
        first_name: "John",
        last_name: "Smith",
        bio: "I am John Smith",
        user_id: user_with_accom.id,
        created_at: Time.now,
        karma_coins: 0,
        host_rating: 0,
        guest_rating: 0
    },
    {
        first_name: "Lucy",
        last_name: "Jones",
        bio: "I am Lucy Jones",
        user_id: user_without_accom.id,
        created_at: Time.now,
        karma_coins: 0,
        host_rating: 0,
        guest_rating: 0
    },
    {
        first_name: "Haley",
        last_name: "Puppet",
        bio: "I am Haley Puppet",
        user_id: admin_user.id,
        created_at: Time.now,
        karma_coins: 0,
        host_rating: 0,
        guest_rating: 0
    }
]

profiles.each do |profile|
    user = User.find(profile[:user_id])
    user_profile = Profile.where(user_id: user) 
    user_profile.update(profile)
end

accommodations = [
    {
        date_created: Time.now,
        name: "Rancho Relaxo",
        description: "Very relaxing",
        country: "",
        city: "Melbourne, Australia",
        address: "8 Boondara Grove",
        host_id: user_with_profile.id,
        accommodation_rating: 0,
        available_start_date: Time.now,
        available_end_date: Time.now,
        accomtype_id: Accomtype.find(1).id
    },
    {
        date_created: Time.now,
        name: "House of Pain",
        description: "Very painful",
        country: "",
        city: "Sydney, Australia",
        address: "99 York St",
        host_id: user_with_accom.id,
        accommodation_rating: 0,
        available_start_date: Time.now,
        available_end_date: Time.now,
        accomtype_id: Accomtype.find(2).id
    },
    {
        date_created: Time.now,
        name: "House of fun",
        description: "Very fun",
        country: "",
        city: "London, UK",
        address: "32 Cumming Street",
        host_id: admin_user.id,
        accommodation_rating: 0,
        available_start_date: Time.now,
        available_end_date: Time.now,
        accomtype_id: Accomtype.find(4).id
    }
]

accommodations.each do |accommodation|
    Accommodation.create!(accommodation)
end

stays = [
    {
        created_at: Time.now,
        accommodation_id: Accommodation.find(1).id,
        start_date: DateTime.parse("24/06/2019").to_date,
        end_date: DateTime.parse("27/06/2019").to_date,
        guest_id: admin_user.id,
        confirmed: false,
        rejected: false,
    },
    {
        created_at: Time.now,
        accommodation_id: Accommodation.find(1).id,
        start_date: DateTime.parse("13/09/2019").to_date,
        end_date: DateTime.parse("15/09/2019").to_date,
        guest_id: user_without_accom.id,
        confirmed: false,
        rejected: false,
    },
    {
        created_at: Time.now,
        accommodation_id: Accommodation.find(2).id,
        start_date: DateTime.parse("10/07/2019").to_date,
        end_date: DateTime.parse("15/07/2019").to_date,
        guest_id: user_with_profile.id,
        confirmed: false,
        rejected: false,
    },
    {
        created_at: Time.now,
        accommodation_id: Accommodation.find(3).id,
        start_date: DateTime.parse("15/10/2019").to_date,
        end_date: DateTime.parse("20/10/2019").to_date,
        guest_id: user_with_profile.id,
        confirmed: false,
        rejected: false,
    }
]

stays.each do |stay|
    Stay.create!(stay)
end

messages = [
    {
        created_at: Time.now,
        content: "Can i bring my dog",
        stay_id: Stay.find(1).id,
        user_id: user_without_accom.id
    },
    {
        created_at: Time.now,
        content: "no",
        stay_id: Stay.find(1).id,
        user_id: user_with_profile.id
    },
    {
        created_at: Time.now,
        content: "Can i stay forever",
        stay_id: Stay.find(2).id,
        user_id: user_without_accom.id
    },
    {
        created_at: Time.now,
        content: "no",
        stay_id: Stay.find(2).id,
        user_id: user_with_accom.id
    }
]

messages.each do |message|
    Message.create!(message)
end

accommodation_reviews = [
    {
        created_at: Time.now,
        communication_rating: 0,
        location_rating: 0,
        cleanliness_rating: 0,
        ammenities_rating: 0,
        host_rating: 0,
        comments: "much very bad",
        stay_id: Stay.find(1).id
    },
    {
        created_at: Time.now,
        communication_rating: 5,
        location_rating: 5,
        cleanliness_rating: 5,
        ammenities_rating: 5,
        host_rating: 5,
        comments: "much very good",
        stay_id: Stay.find(2).id
    },
    {
        created_at: Time.now,
        communication_rating: 3,
        location_rating: 3,
        cleanliness_rating: 3,
        ammenities_rating: 3,
        host_rating: 3,
        comments: "much very good",
        stay_id: Stay.find(3).id
    },
    {
        created_at: Time.now,
        communication_rating: 3,
        location_rating: 5,
        cleanliness_rating: 2,
        ammenities_rating: 6,
        host_rating: 1,
        comments: "Very average",
        stay_id: Stay.find(4).id
    }
]

accommodation_reviews.each do |accommodation_review|
    Accommodationreview.create!(accommodation_review)
end

guest_reviews = [
    {
        created_at: Time.now,
        communication_rating: 0,
        ease_of_hosting_rating: 0,
        cleanliness_rating: 0,
        comments: "rude",
        stay_id: Stay.find(1).id
    },
    {
        created_at: Time.now,
        communication_rating: 5,
        ease_of_hosting_rating: 5,
        cleanliness_rating: 5,
        comments: "polite",
        stay_id: Stay.find(2).id
    },
    {
        created_at: Time.now,
        communication_rating: 3,
        ease_of_hosting_rating: 3,
        cleanliness_rating: 3,
        comments: "ok guest",
        stay_id: Stay.find(3).id
    },
    {
        created_at: Time.now,
        communication_rating: 2,
        ease_of_hosting_rating: 3,
        cleanliness_rating: 4,
        comments: "pretty good",
        stay_id: Stay.find(4).id
    }
]

guest_reviews.each do |guest_review|
    Guestreview.create!(guest_review)
end