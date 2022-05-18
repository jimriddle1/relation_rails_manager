# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Pokemon.destroy_all
Trainer.destroy_all

ash = Trainer.create!(name: 'Ash', age: 10, all_8_badges: true)

brock = Trainer.create!(name: 'Brock', age: 15, all_8_badges: false)
misty = Trainer.create!(name: 'Misty', age: 10, all_8_badges: false)
lt_surge = Trainer.create!(name: 'Lt. Surge', age: 34, all_8_badges: false)
erika = Trainer.create!(name: 'Erika', age: 19, all_8_badges: false)
koga = Trainer.create!(name: 'Koga', age: 40, all_8_badges: false)
sabrina = Trainer.create!(name: 'Sabrina', age: 21, all_8_badges: false)
blaine = Trainer.create!(name: 'Blaine', age: 58, all_8_badges: false)
giovanni = Trainer.create!(name: 'Giovanni', age: 41, all_8_badges: false)

lorelei = Trainer.create!(name: 'Lorelei', age: 25, all_8_badges: true)
bruno = Trainer.create!(name: 'Bruno', age: 35, all_8_badges: true)
agatha = Trainer.create!(name: 'Agatha', age: 70, all_8_badges: true)
lance = Trainer.create!(name: 'Lance', age: 25, all_8_badges: true)

gary = Trainer.create!(name: 'Gary', age: 10, all_8_badges: true)

ash.pokemons.create!(name: 'Squirtle', pokedex_num: 7, fainted: false)
ash.pokemons.create!(name: 'Charmander', pokedex_num: 4, fainted: true)
ash.pokemons.create!(name: 'Bulbasaur', pokedex_num: 1, fainted: true)

brock.pokemons.create!(name: 'Geodude', pokedex_num: 74, fainted: true)
brock.pokemons.create!(name: 'Onix', pokedex_num: 95, fainted: true)

misty.pokemons.create!(name: 'Staryu', pokedex_num: 120, fainted: true)
misty.pokemons.create!(name: 'Starmie', pokedex_num: 121, fainted: true)

lt_surge.pokemons.create!(name: 'Voltorb', pokedex_num: 100, fainted: true)
lt_surge.pokemons.create!(name: 'Pikachu', pokedex_num: 25, fainted: true)
lt_surge.pokemons.create!(name: 'Raichu', pokedex_num: 26, fainted: true)

erika.pokemons.create!(name: 'Victreebel', pokedex_num: 71, fainted: true)
erika.pokemons.create!(name: 'Tangela', pokedex_num: 114, fainted: true)
erika.pokemons.create!(name: 'Vileplume', pokedex_num: 45, fainted: true)

koga.pokemons.create!(name: 'Koffing', pokedex_num: 109, fainted: true)
koga.pokemons.create!(name: 'Muk', pokedex_num: 89, fainted: true)
koga.pokemons.create!(name: 'Koffing', pokedex_num: 109, fainted: true)
koga.pokemons.create!(name: 'Weezing', pokedex_num: 110, fainted: true)

sabrina.pokemons.create!(name: 'Kadabra', pokedex_num: 64, fainted: true)
sabrina.pokemons.create!(name: 'Mr. Mime', pokedex_num: 122, fainted: true)
sabrina.pokemons.create!(name: 'Venomoth', pokedex_num: 49, fainted: true)
sabrina.pokemons.create!(name: 'Alakazam', pokedex_num: 65, fainted: true)

blaine.pokemons.create!(name: 'Growlithe', pokedex_num: 58, fainted: true)
blaine.pokemons.create!(name: 'Ponyta', pokedex_num: 77, fainted: true)
blaine.pokemons.create!(name: 'Rapidash', pokedex_num: 78, fainted: true)
blaine.pokemons.create!(name: 'Arcanine', pokedex_num: 59, fainted: true)

giovanni.pokemons.create!(name: 'Rhyhorn', pokedex_num: 111, fainted: true)
giovanni.pokemons.create!(name: 'Dugtrio', pokedex_num: 51, fainted: true)
giovanni.pokemons.create!(name: 'Nidoqueen', pokedex_num: 31, fainted: true)
giovanni.pokemons.create!(name: 'Nidoking', pokedex_num: 34, fainted: true)
giovanni.pokemons.create!(name: 'Rhydon', pokedex_num: 112, fainted: true)

lorelei.pokemons.create!(name: 'Dewgong', pokedex_num: 87, fainted: true)
lorelei.pokemons.create!(name: 'Cloyster', pokedex_num: 91, fainted: true)
lorelei.pokemons.create!(name: 'Slowbro', pokedex_num: 80, fainted: true)
lorelei.pokemons.create!(name: 'Jynx', pokedex_num: 124, fainted: true)
lorelei.pokemons.create!(name: 'Lapras', pokedex_num: 131, fainted: true)

bruno.pokemons.create!(name: 'Onix', pokedex_num: 95, fainted: true)
bruno.pokemons.create!(name: 'Hitmonchan', pokedex_num: 107, fainted: true)
bruno.pokemons.create!(name: 'Hitmonlee', pokedex_num: 106, fainted: true)
bruno.pokemons.create!(name: 'Onix', pokedex_num: 95, fainted: true)
bruno.pokemons.create!(name: 'Machamp', pokedex_num: 68, fainted: true)

agatha.pokemons.create!(name: 'Gengar', pokedex_num: 94, fainted: true)
agatha.pokemons.create!(name: 'Golbat', pokedex_num: 42, fainted: true)
agatha.pokemons.create!(name: 'Haunter', pokedex_num: 93, fainted: true)
agatha.pokemons.create!(name: 'Arbok', pokedex_num: 24, fainted: true)
agatha.pokemons.create!(name: 'Gengar', pokedex_num: 94, fainted: true)

lance.pokemons.create!(name: 'Gyrados', pokedex_num: 130, fainted: true)
lance.pokemons.create!(name: 'Dragonair', pokedex_num: 148, fainted: true)
lance.pokemons.create!(name: 'Dragonair', pokedex_num: 148, fainted: true)
lance.pokemons.create!(name: 'Aerodactyl', pokedex_num: 142, fainted: true)
lance.pokemons.create!(name: 'Dragonite', pokedex_num: 149, fainted: true)

gary.pokemons.create!(name: 'Sandslash', pokedex_num: 28, fainted: true)
gary.pokemons.create!(name: 'Alakazam', pokedex_num: 65, fainted: true)
gary.pokemons.create!(name: 'Exeggutor', pokedex_num: 103, fainted: true)
gary.pokemons.create!(name: 'Ninetales', pokedex_num: 38, fainted: true)
gary.pokemons.create!(name: 'Cloyster', pokedex_num: 91, fainted: true)
gary.pokemons.create!(name: 'Jolteon', pokedex_num: 135, fainted: true)
