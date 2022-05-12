class CreateTrainer < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :age
      t.boolean :all_8_badges
      t.timestamps
    end
  end
end
