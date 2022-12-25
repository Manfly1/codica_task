# frozen_string_literal: true

class Doctor < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, authentication_keys: [:phone]

  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments, source: :user
end
