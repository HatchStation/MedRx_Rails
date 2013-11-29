class HomeController < ApplicationController
  def index
  end

  def dashboard
    if is_doctor?
      redirect_to doctors_path
    else
    end
  end

  private

  def is_doctor?
    current_user.profile.role == 'doctor' if current_user
  end
end
