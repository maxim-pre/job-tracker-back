# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


10.times do
    Job.create({
    title: 'software Engineer',
    url: "http://bugtrackeradmin.herokuapp.com",
    company: Faker::Company.name,
    location: 'London',
    description: 'senior software engineering position',
    date_applied: "15/05/2023",
    status: "applied",
    min_salary: "30000",
    max_salary: "40000",
    user_id: 1,
    })
end
