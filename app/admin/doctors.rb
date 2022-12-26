# frozen_string_literal: true

ActiveAdmin.register Doctor, namespace: false do
  permit_params :doctor_id, :type, :phone, :password, :password_confirmation, :avatar, category_ids: []

  index do
    selectable_column
    if current_user.admin?
      id_column
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
    end
    column :phone

    column 'categories', &:categories
    actions
  end

  show do
    attributes_table do
      row :phone
      row :categories
      row 'Avatar' do |doctor|
        cl_image_tag url_for(doctor.avatar)
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :phone
      f.input :categories, as: :check_boxes
      f.input :avatar, as: :file
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
end
