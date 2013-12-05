class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|

      t.references :patient
      t.references :medication
      t.timestamps
    end
  end
end
