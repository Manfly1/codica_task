# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointment', type: :request do
  it "creates a Appointment and redirects to the appointment's page" do
    sign_in AdminUser.create!(phone: '1231231231', password: '123123')
    doctor =  FactoryBot.create(:doctor)
    patient = FactoryBot.create(:patient)
    get '/appointments/new'
    expect(response).to render_template(:new)

    post '/appointments', params: { appointment: { doctor_id: doctor.id, patient_id: patient.id } }

    expect(response).to redirect_to(assigns(:appointment))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include('Appointment was successfully created.')
  end
end
