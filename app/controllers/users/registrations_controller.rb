# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    include DevisePermittedParameters

    private

    def update_resource(resource, params)
      if params[:password].present? || params[:current_password].present?
        resource.update_with_password(params)
      else
        params.delete(:current_password)
        resource.update_without_password(params)
      end
    end

    def after_update_path_for(_resource)
      users_profile_path
    end
  end
end
