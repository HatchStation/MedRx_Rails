class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor

  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_one :profile, :through => :user

  #validates :first_name, presence: true
  #validates :device_no, presence: true, uniqueness: true

  accepts_nested_attributes_for :user

end
