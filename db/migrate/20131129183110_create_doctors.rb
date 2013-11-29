class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|

      t.references :user
      t.timestamps
    end
  end
end
