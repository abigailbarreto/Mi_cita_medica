class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user

  validates :meet_motive, presence: true
  
  before_create :set_meet_state
  
  validate :meet_date_validity

  validate :meet_time_validity
  
  def meet_date_validity
    return if meet_date > Date.today
    errors.add :due_date, 'La fecha no puede ser anterior a la fecha actual'
  end

  def meet_time_validity
    return if meet_time && (meet_time.hour >= 8 && meet_time.hour <= 20)
    errors.add(:meet_time, 'La hora debe estar entre las 8am y 8pm')
  end  

  private 
  def set_meet_state
    self.meet_state = true
  end

end
