class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pokemons, :level, :pokedex_num
  end
end
