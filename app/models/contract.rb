class Contract < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  attr_protected :id
end