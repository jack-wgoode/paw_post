class AddForeignKeyToDogs <ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :dogs, :owners
  end
end 