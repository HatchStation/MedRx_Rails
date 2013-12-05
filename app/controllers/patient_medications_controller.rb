class PatientMedicationsController < ApplicationController
  def index
    @patient = Patient.find(params[:patient_id])
    @patient_medications = @patient.patient_medications
  end

  def new_medication
    PatientMedication.create(:patient_id => params[:patient_id],:medication_id => params[:patient_medication][:medication_id])
    redirect_to patient_medications_path(:patient_id=>params[:patient_id])
  end

  def destroy
    patient_medication = PatientMedication.find(params[:id])
    patient_medication.destroy
    redirect_to patient_medications_path(:patient_id=>params[:patient_id])
  end

end
