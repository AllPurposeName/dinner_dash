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


  def users_minus_dj
    users_minus_dj = User.all - [User.first]
  end

  users_minus_dj.each do |user|
    5.times do |iteration|
      user.orders.create({ status: (0..3).to_a.sample })
    end
  end

  class BreedMaker
    attr_accessor :breed_list

    def initialize
      @breed_list = ["Donskoy", "American Bobtail",
     "Havanna Brown", "Ocicat",
     "Oriental Shorthair", "Savannah",
     "Australian Mist", "British Shorthair",
     "Munchkin", "Russian Black"]
    end

    def breed_name
      @breed_list.delete(@breed_list.sample)
    end

    def run
      10.times do |iteration|
      Breed.create({name: breed_name,
                    retired: false,
                    description: Faker::Lorem.sentences(2),
                    image_path: nil})
      end
    end
  end

  BreedMaker.new.run


class CatMaker
  def random_first_name
    [:first_name, :prefix].sample
  end

  def random_last_name
    [:last_name, :first_name, :suffix].sample
  end

  def cat_first_name
    Faker::Name.send(random_first_name)
  end

  def cat_last_name
    Faker::Name.send(random_last_name)
  end

  def cat_full_name
    "#{cat_first_name} #{cat_last_name}"
  end

  def cents
    ["00", "50"].sample
  end

  def dollars
    common = [10, 12, 15,].sample
    uncommon = [20, 25, 30, 42].sample
    rare = [100, 150, 125].sample
  end

  def cat_price
    ((1..50).to_a.sample.to_s + cents).to_i
  end

  def cat_description
  [ "description one",
    "description one",
    "description one",
    "description one",
    "description one",
    "description one",
  ]
  end

  def random_cat_pic
    Dir["app/assets/images/individuals/*.jpg"].sample.split("/").last
  end

  def run
    40.times do |iteration|
      Breed.all.sample.cats.create({
                name: cat_full_name,
                price: cat_price,
                retired: false,
                description: Faker::Lorem.sentences(2),
                image_path: random_cat_pic
                })
    end
  end
end

CatMaker.new.run

  def random_cat
    (1..Cat.count).to_a.sample
  end

  def random_quantity
    (1..4).to_a.sample
  end

  def random_order_cat
    users_minus_dj.sample.orders.all.sample.order_cats
  end


  35.times do |iteration|
    random_order_cat.create({ cat_id: random_cat,
                              quantity: random_quantity
                            })
  end
