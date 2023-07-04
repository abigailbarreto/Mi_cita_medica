class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @future_appointments = Appointment.where('meet_date >= ?', Date.today)
                                      .where(user_id: current_user.id)
                                      .order(meet_date: :asc)
    @past_appointments = Appointment.where('meet_date < ?', Date.today)
                                    .where(user_id: current_user.id)
                                    .order(meet_date: :desc)

  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = current_user.appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Cita Programada" }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Cita Actualizada" }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Cita Cancelada" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:meet_date, :meet_time, :meet_motive, :meet_state, :medico_id, :user_id)
    end
end
