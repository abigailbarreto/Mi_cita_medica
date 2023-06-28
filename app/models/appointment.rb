class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user
  validates :meet_motive, presence: true
  before_create :set_meet_state 

  private 
  def set_meet_state
    self.meet_state = true
  end

  def set_meet_date
    self.meet_date = I18n.l(Date.today, format: '%A, %d de %B de %Y')
  end
  
end
