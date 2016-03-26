class Event < ActiveRecord::Base
  belongs_to :address
  belongs_to :event_category
  belongs_to :unit
  belongs_to :speaker, class_name: "User"
end
