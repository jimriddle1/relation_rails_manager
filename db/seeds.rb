# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Pokemon.destroy_all
Trainer.destroy_all



ash = Trainer.create!(name: 'Ash', age: 10, all_8_badges: false)
brock = Trainer.create!(name: 'Brock', age: 15, all_8_badges: false)

ash.pokemons.create!(name: 'Pikachu', pokedex_num: 25, fainted: true)
ash.pokemons.create!(name: 'Squirtle', pokedex_num: 7, fainted: false)
ash.pokemons.create!(name: 'Charmander', pokedex_num: 4, fainted: true)

brock.pokemons.create!(name: 'Geodude', pokedex_num: 74, fainted: false)
brock.pokemons.create!(name: 'Onix', pokedex_num: 95, fainted: true)
