class Appointment < ApplicationRecord
  MAX_APPOINTMENTS = 10

  belongs_to :doctor
  belongs_to :patient

  validates :reccomendation, length: { minimum: 10, maximum: 100 }, allow_blank: true
  validates :validate_appointments_count
  before_save :close_appointment

  private

  def close_appointment
    return if reccomendation.blank?
    return if closed?

    self.update_column(closed:  true)
  end

  def validate_appointments_count
    if self.doctor.appointments.count >= MAX_APPOINTMENTS
      self.errors.add(:base, "Doctor has more than #{MAX_APPOINTMENTS} active consultations")
    end
  end
end
