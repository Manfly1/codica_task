# frozen_string_literal: true

module Doctors
  class AppointmentsController < ApplicationController
    before_action :set_appointment
    authorize_resource

    def index
      @appointments = current_doctor.appointments.where(closed: params[:closed])
    end

    def show; end

    def edit; end

    def update
      if @appointment.update(permitted_params)
        @appointment.closed!
        redirect_to doctors_appointments_path(closed: true)
      else
        render :edit
      end
    end

    private

    def set_appointment
      @appointment = current_doctor.appointments.find(params[:id])
    end

    def permitted_params
      params.require(:appointment).permit(:body)
    end
  end
end
