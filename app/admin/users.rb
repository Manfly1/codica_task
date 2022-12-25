# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :phone, :password, :password_confirmation, :name

  form do |f|
    f.inputs do
      f.input :phone
      f.input :password, required: f.object.new_record?
      f.input :password_confirmation, required: f.object.new_record? if f.object.new_record?
      f.input :name
    end
    f.actions
  end
end
