# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  validates :phone, presence: true, numericality: true, length: { minimum: 9, maximum: 16 }

  before_save :set_type

  def admin?
    is_a?(AdminUser)
  end

  def doctor?
    is_a?(Doctor)
  end

  def patient?
    is_a?(Patient)
  end

  def email_required?
    false
  end

  def name
    phone
  end

  private

  def set_type
    self.type ||= Patient.name
  end
end
