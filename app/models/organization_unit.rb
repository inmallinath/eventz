class OrganizationUnit < ActiveRecord::Base
  belongs_to :organization
  belongs_to :unit
end
