# frozen_string_literal: true

ActiveAdmin.register Patient, namespace: false do
  permit_params :type, :phone, :email, :password, :password_confirmation

  show do
    attributes_table do
      row :phone
    end
  end

  form do |f|
    f.inputs do
      f.input :phone
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
end
