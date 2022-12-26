ActiveAdmin.register Admin, namespace: false do
  permit_params :type, :phone, :password, :password_confirmation
end
