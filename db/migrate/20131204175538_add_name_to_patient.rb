class AddNameToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :device_no, :string
    add_column :patients, :diagnosis , :text
  end
end
