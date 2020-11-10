# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
car1 = Vehicle.create!(vehicle_identifier: "SH-1532", sent_at:"2020-10-28 19:06:24", longitude:-70.542811, latitude:-33.351792 )
car2 = Vehicle.create!(vehicle_identifier: "DS-4314", sent_at:"2020-10-23 19:06:24", longitude:-70.42811, latitude:-33.51792 )


car1.gps.create!([{sent_at:"2020-10-28 19:06:24", longitude:-70.542811, latitude:-33.351792 },
                 {sent_at:"2020-10-18 19:06:24", longitude:-70.52811, latitude:-33.35192 }])
car2.gps.create!([{sent_at:"2020-10-23 19:06:24", longitude:-70.42811, latitude:-33.51792 },
                 {sent_at:"2020-09-28 19:06:24", longitude:-70.42811, latitude:-33.31792 }])