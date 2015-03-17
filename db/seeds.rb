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
    full_name: "Dj G",
    email: "djloveshisgf@gmail.com" },

  { username:"Rachel",
    password: "password",
    role: 0,
    full_name: "Rachel Warbelow",
    email: "demo+rachel@jumpstartlab.com" },

  { username: "fred",
    password: "blocknroll",
    role: 1,
    full_name: "Fred B",
    email: "fredrules@gmail.com" },

  { username: "tino",
    password: "poop",
    role: 1,
    full_name: "Tino E",
    email: "fredrules@gmail.com" },

  { username: "j3",
    password: "password",
    role: 0,
    full_name: "Jeff Casimir",
    email: "demo+jeff@jumpstartlab.com" },

  { username: "novohispano",
    password: "password",
    role: 0,
    full_name: "Jorge Tellez",
    email: "demo+jorge@jumpstartlab.com" },

  { username: "josh",
    password: "password",
    role: 1,
    full_name: "Josh Cheek",
    email: "demo+josh@jumpstartlab.com" }])

Breed.create([
  { name: "sabertooth",
    retired: false,
    description: "A tasty large fanged feline once thought to be extinct. Don't worry, we'll get the job done." },

  { name: "prionailurus viverrinus",
    retired: false,
      description: "This cat lives near marshes, mangroves, rivers and streams in India and Southeast Asia. Our finest import."},

  { name: "oncilla",
    retired: false,
    description: "This small spotted cat's meat is lean and tender. Goes great between two slices of our signature Rye bread." },

  { name: "oriental shorthair",
    retired: false,
    description: "Like the Siamese, Oriental Shorthairs have almond-shaped eyes, a triangular head shape, large ears, and an elongated, slender, and muscular body. Excellent for an appetizer." },

  { name: "black cat",
    retired: false,
    description: "Halloween is always just around the corner. Fill up on one of these cheap tickets and we'll let you keep the... remains." }])

Breed.find_by(name: "sabertooth").cats.create([
  { name:"sabertooth 1",
    price: 1000,
    retired: false,
    description: "cool cat 1" },

    { name:"sabertooth 2",
      price: 2000,
      retired: false,
      description: "cool cat 2" }])

Breed.find_by(name: "oncilla").cats.create([
  { name:"oncilla 1",
    price: 2000,
    retired: false,
    description: "cool cat 3" },

    { name:"oncilla 2",
      price: 3000,
      retired: false,
      description: "cool cat 4" }
])

Breed.find_by(name: "oriental shorthair").cats.create([
  { name:"oriental shorthair 1",
    price: 4000,
    retired: false,
    description: "cool cat 5" },

    { name:"oriental shorthair 2",
      price: 5000,
      retired: false,
      description: "cool cat 6" }
])

Breed.find_by(name: "black cat").cats.create([
  { name:"black cat 1",
    price: 3500,
    retired: false,
    description: "cool cat 7" },

    { name:"black cat 2",
      price: 4000,
      retired: false,
      description: "cool cat 8" }
])

Breed.find_by(name: "prionailurus viverrinus").cats.create(
  { name:"fishing cat 1",
    price: 1000,
    retired: false,
    description: "cool cat 9" })
