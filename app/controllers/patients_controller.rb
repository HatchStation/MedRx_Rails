class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :patient_medication]

  # GET /patients
  # GET /patients.json
  def index
    if current_user and current_user.doctor
      @patients = current_user.doctor.patients
    else
      redirect_to doctors_path, notice: 'Update profile Role.'
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @patient.build_user
    @patient.build_user.build_profile
  end

  # GET /patients/1/edit
  def edit
  end


  # POST /patients
  # POST /patients.json
  def create
    #@patient = Patient.new(patient_params)
    #raise patient_params.to_yaml

    patient_parameters = patient_params
    patient_parameters[:user_attributes][:password] = patient_parameters[:user_attributes][:password_confirmation] = Devise.friendly_token.first(7)
    @patient = current_user.doctor.patients.new(patient_parameters)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      #params[:patient].permit(:diagnosis, :device_no)
      params.require(:patient).permit(:device_no, user_attributes: [:id, :email, :username, :password, :password_confirmation, profile_attributes:[:first_name,:last_name,:date_of_birth, :gender]])
    end
end
