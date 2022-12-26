# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { "Hello #{current_user.phone}, this is a polyclinic management project" }
end
