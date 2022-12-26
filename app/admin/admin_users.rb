# frozen_string_literal: true

ActiveAdmin.register AdminUser, namespace: false do
  permit_params :type, :phone, :password, :password_confirmation
end
