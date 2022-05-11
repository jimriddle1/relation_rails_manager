class AddNameToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :created_at, :datetime, null: false
    add_column :pokemons, :updated_at, :datetime, null: false
    add_column :pokemons, :name, :string
  end
end
