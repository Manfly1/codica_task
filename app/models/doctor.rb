# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, authentication_keys: [:phone]

  PHONE_NUMBER_REGEXP = /\A\+[0-9]+\z/.freeze

  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments, source: :user

  validates :phone, presence: true, uniqueness: true,
    format: { with: PHONE_NUMBER_REGEXP }
  validates :password, presence: { on: :create },
    length: { in: 5..10 }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
