# frozen_string_literal: true

ActiveAdmin.register Doctor do

  permit_params :phone, :password, :password_confirmation, :name, :category_id

  index do
    selectable_column
    id_column
    column :category
    column :phone_
    column :name
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :phone_
      f.input :password, required: f.object.new_record?
      f.input :password_confirmation, required: f.object.new_record? if f.object.new_record?
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :category
      row :phone
      row :name
      row :created_at
      row :updated_at
    end
  end

  controller do
    def create
      create! { admin_doctors_url }
    end
  end
end
