# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "CodebaseAdmin",
            email: "codebase@email.com",
            password: "codebase",
            status: 0)

5.times do |n|
  User.create!(name: "かめや#{n + 1}",
              email: "kameya#{n + 1}@email.com",
              password: "kameyatest")
end

10.times do |n|
  Book.create!(image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/book_01.jpg"), filename: "book_01.jpg"),
              title: "Ruby#{n + 1}",
              author: "伊藤#{n + 1}")
end

10.times do |n|
  Reservation.create!(user_id: rand(1..4),
                      book_id: n+1,
                      status: rand(2),
                      reserved_start: Date.today,
                      reserved_end: Date.today + 7)
end
