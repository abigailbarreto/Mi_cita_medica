class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user
  validates :meet_motive, presence: true
  before_create :set_meet_state

  private 
  def set_meet_state
    self.meet_state = true
  end
end
