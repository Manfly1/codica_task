# frozen_string_literal: true

ActiveAdmin.register AdminUsers, namespace: false do
  permit_params :type, :phone, :password, :password_confirmation
end
