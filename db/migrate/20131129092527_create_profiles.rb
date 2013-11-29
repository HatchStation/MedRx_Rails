class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :image
      t.string :role
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
