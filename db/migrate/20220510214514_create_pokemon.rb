class CreatePokemon < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.references :trainers, foreign_key: true
    end
  end
end
