# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Doctor management', type: :feature do
  let(:doctor) { FactoryBot.create(:doctor) }
  let(:patient) { FactoryBot.create(:patient) }
  let(:appointment) { FactoryBot.create(:appointment, doctor_id: doctor.id, patient_id: patient.id) }

  scenario 'Login flow' do
    visit '/'
    fill_in 'Title', with: doctor.phone.to_s
    fill_in 'Password', with: doctor.password.to_s
    click_button 'Login'
    expect(page).to have_text("Hello #{doctor.phone}, this is a polyclinic management project")
  end

  scenario 'Doctor can edit appointment reccomendation and it closes automatically' do
    find("a[href='/appointments']").click
    find("a[href='/appointments/#{appointment.id}/edit']").click
    fill_in 'Recommendation', with: '10_symbols'
    click_button 'Update Appointment'
    expect(page).to include 'Appointment was successfully updated.'
  end
end
