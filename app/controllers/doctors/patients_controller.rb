# frozen_string_literal: true

module Doctors
  class PatientsController < ApplicationController
    authorize_resource class: false
    authorize_resource class: 'Appointment'

    def index; end

    def show
      @patient = current_doctor.patients.find(params[:id])
      @appointments = @patient.appointments.where(doctor_id: current_doctor.id)
    end
  end
end
