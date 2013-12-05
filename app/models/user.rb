class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_one :doctor, dependent: :destroy
  has_one :patient, dependent: :destroy

  accepts_nested_attributes_for :profile


  after_create :build_user_profile

  def build_user_profile
    self.create_profile if self.profile.blank?
  end



end
