class AddColumnToOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :email, :string
    add_column :owners, :password_digest, :string
  end
end
