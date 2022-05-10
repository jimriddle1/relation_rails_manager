class AddFaintedToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :fainted, :boolean
  end
end
