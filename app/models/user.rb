# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, authentication_keys: [:phone]

  PHONE_NUMBER_REGEXP = /\A\+[0-9]+\z/.freeze

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :phone, presence: true, uniqueness: true,
                    format: { with: PHONE_NUMBER_REGEXP }
  validates :password, presence: { on: :create },
                       length: { in: 5..10 }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def admin?
    is_a? Admin
  end

  def doctor?
    is_a? Doctor
  end

  def patient?
    is_a? User
  end
end
