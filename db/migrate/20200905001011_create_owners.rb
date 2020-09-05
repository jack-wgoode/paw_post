class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|

      t.timestamps null: false
    end
  end
end
