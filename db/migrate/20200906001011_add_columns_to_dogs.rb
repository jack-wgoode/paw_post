class AddColumnToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :name, :string
    add_column :dogs, :breed, :string
    add-column :dogs, :color, :string
    add_column :dogs, :age, :integer
    add_column :dogs, :sex, :string
    add_column :dogs, :spayed_or_neutered, :boolean
    add_column :dogs, :temperament, :string
    add_column :dogs, :favorite_game, :string
    add_column :dogs, :comments, :text
      
  end
end
