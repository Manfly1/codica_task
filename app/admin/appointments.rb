# frozen_string_literal: true

ActiveAdmin.register Appointment do
  permit_params :user_id, :doctor_id, :closed, :recommendation

  scope :all, default: true

  index do
    selectable_column
    column :id
    column :user
    column :doctor
    column :closed
    column :recommendation
    actions
  end
end
