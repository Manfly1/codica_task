# frozen_string_literal: true

ActiveAdmin.register Category do

  config.sort_order = 'id_asc'

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :doctors
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
      row :doctors
    end
  end

  controller do
    skip_before_action :set_all_categories

    def create
      create! { admin_categories_url }
    end
  end
end
