class OrganizationAddress < ActiveRecord::Base
  belongs_to :organization
  belongs_to :address
end
