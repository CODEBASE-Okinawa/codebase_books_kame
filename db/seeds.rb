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

# Book.create!(title: "ゼロからわかる-Ruby-超入門-かんたんIT基礎講座",
#              image: "book_01.jpg",
#              author: "五十嵐 邦明")

# Book.create!(title: "チェリー本",
#              image: "book_01.jpg",
#              author: "伊藤さん")

# Book.create!(title: "速習実践ガイド",
#              image: "book_01.jpg",
#              author: "株式会社万葉")

