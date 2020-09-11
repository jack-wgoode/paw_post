class AddColumnsToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :name, :string
    add_column :dogs, :breed, :string
    add_column :dogs, :temperament, :string
    add_column :dogs, :comments, :text
    add_column :dogs, :owner_id, :integer
  end
end
