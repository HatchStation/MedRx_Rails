class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor

  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_one :profile, :through => :user

  #validates :first_name, presence: true
  validates :device_no, presence: true, uniqueness: true

  accepts_nested_attributes_for :user

  #before_validation :password_generation
  #def password_generation
  #  password_confirmation = password = Devise.friendly_token.first(7) if password.nil? || password.blank?
  #end

  def age
    return nil if self.profile and self.profile.date_of_birth.nil?
    dob = self.profile.date_of_birth
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

end
