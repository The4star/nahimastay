# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = [
    {
        privilege: "admin"
    },
    {
        privilege: "standard_user"
    },
    {
        privilege: "premium_user"
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