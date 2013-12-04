class AddNameToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :date_of_birth, :datetime
    add_column :patients, :gender, :string
    add_column :patients, :diagnosis , :text
  end
end
