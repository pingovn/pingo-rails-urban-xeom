class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.date :birthday
      t.integer :gender
      t.string :driver_license
      t.string :job

      t.timestamps
    end
  end
end
