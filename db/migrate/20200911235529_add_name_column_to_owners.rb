class AddNameColumnToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :name, :string
  end
end
