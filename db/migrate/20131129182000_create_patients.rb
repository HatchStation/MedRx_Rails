class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.references :user
      t.references :doctor
      t.timestamps
    end
  end
end
