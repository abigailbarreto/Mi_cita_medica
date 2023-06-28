class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user
  validates :meet_motive, presence: true
  before_create :set_meet_state
  validate :meet_date_validity
  
  def meet_date_validity
    return if meet_date > Date.today
    errors.add :due_date, 'La fecha no puede ser anterior a la fecha actual'
  end

  private 
  def set_meet_state
    self.meet_state = true
  end

  def set_meet_date
    self.meet_date = I18n.l(Date.today, format: '%A, %d de %B de %Y')
  end
  
end
