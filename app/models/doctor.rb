class Doctor < ActiveRecord::Base
  belongs_to :user
  has_many :patients, dependent: :destroy
end
