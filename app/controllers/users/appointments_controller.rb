# frozen_string_literal: true

module Users
  class AppointmentsController < ApplicationController
    authorize_resource

    MAX_APPOINTMENTS = 10

    def index
      @appointments = current_user.appointments.where(closed: params[:closed])
    end

    def show
      @appointment = current_user.appointments.find(params[:id])
    end

    def create
      if appointments_count_reached?
        redirect_back_or_to doctors_path
      elsif current_user.appointments.create(permitted_params)
        redirect_to users_appointments_path(closed: false)
      else
        redirect_to root_path
      end
    end

    private

    def find_doctor
      Doctor.find(params[:doctor_id])
    end

    def appointments_count_reached?
      find_doctor.appointments.count >= MAX_APPOINTMENTS
    end

    def permitted_params
      params.permit(:doctor_id)
    end
  end
end
