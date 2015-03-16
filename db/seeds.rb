# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  { username:"dj",
    password: "dj",
    role: 1,
    full_name: "Dj",
    email: "djloveshisgf@gmail.com" },

    { username: "fred",
      password: "blocknroll",
      role: 1,
      full_name: "Fred",
      email: "fredrules@gmail.com" },

      { username: "tino",
        password: "poop",
        role: 1,
        full_name: "Tino",
        email: "fredrules@gmail.com" }])

Breed.create([
  { name: "sabertooth",
    retired: false,
    description: "A tasty large fanged feline" },

    { name: "prionailurus viverrinus",
      retired: false,
      description: "Lives: near marshes, mangroves, rivers and streams in India and Southeast Asia"},

      { name: "oncilla",
        retired: false,
        description: "Aka little spotted cat" }])

Breed.find_by(name: "sabertooth").cats.create([
  { name:"sabertooth 1",
    price: 1000,
    retired: false,
    description: "cool cat" },

    { name:"sabertooth 2",
      price: 2000,
      retired: false,
      description: "cool cat" }])

Breed.find_by(name: "oncilla").cats.create([
  { name:"oncilla 1",
    price: 2000,
    retired: false,
    description: "cool cat" },

    { name:"oncilla 2",
      price: 2000,
      retired: false,
      description: "cool cat" }
])

Breed.find_by(name: "prionailurus viverrinus").cats.create(
  { name:"ls ksdljsdf1",
    price: 1000,
    retired: false,
    description: "cool cat" })
