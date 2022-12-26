# frozen_string_literal: true

ActiveAdmin.register Category, namespace: false do
  permit_params :name
end
