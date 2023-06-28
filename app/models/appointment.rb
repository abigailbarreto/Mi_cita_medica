class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user
  validates :meet_motive, presence: true
end
