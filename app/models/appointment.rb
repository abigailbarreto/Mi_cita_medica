class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user
end
