class Profile < ActiveRecord::Base

  GENDER = [{:title => "Male", :name => "male"}, {:title => "Female", :name => "female"}]

  belongs_to :user
end
