ActiveAdmin.register Doctor, namespace: false do
  permit_params :doctor_id, :role, :phone, :password, :password_confirmation, category_ids: []

  index do
    selectable_column
    if current_user.admin?
      id_column
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
    end
    column :phone

    column 'categories' do |doctor|
      doctor.categories
    end
    actions
  end

  show do
    attributes_table do
      row :phone
      row :categories
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :phone
      f.input :categories, as: :check_boxes

      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
end
