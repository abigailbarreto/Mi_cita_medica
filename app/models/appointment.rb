class Appointment < ApplicationRecord
  belongs_to :medico
  belongs_to :user

  validates :meet_motive, presence: true
  validates :meet_date, presence: true
  validates :meet_time, presence: true

  before_create :set_meet_state
  
  validate :validar_unica_hora_fecha_medico
  validate :validar_unica_hora_fecha_usuario

  private

  def validar_unica_hora_fecha_medico
    if Appointment.exists?(meet_time: meet_time, meet_date: meet_date, medico_id: medico_id)
      errors.add(:base, "El médico ya tiene una cita programada en ese horario")
    end
  end

  def validar_unica_hora_fecha_usuario
    if Appointment.exists?(meet_time: meet_time, meet_date: meet_date, user_id: user_id)
      errors.add(:base, "Ya tienes una cita programada para esa fecha y hora")
    end
  end
   
  def set_meet_state
    self.meet_state = true
  end
  
  # validate :meet_date_validity

  # validate :meet_time_validity
  
  # def meet_date_validity
  #   return if meet_date >= Date.today
  #   errors.add :due_date, 'La fecha no puede ser anterior a la fecha actual'
  # end

  # def meet_time_validity
  #   return if meet_time && (meet_time.hour >= 8 && meet_time.hour <= 20)
  #   errors.add(:meet_time, 'La hora debe estar entre las 8am y 8pm')
  # end  


end
