class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    doctor = @appointment.doctor_id
    patient = @appointment.patient_id
    @doctor = Doctor.find(doctor)
    @patient = Patient.find(patient)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :time)
  end
end
