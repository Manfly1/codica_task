# frozen_string_literal: true

class Doctor < User
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :categories
  has_one_attached :avatar
end
