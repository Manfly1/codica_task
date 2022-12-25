# frozen_string_literal: true

module Doctors
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    private

    def update_resource(resource, params)
      if params[:password].present? || params[:current_password].present?
        resource.update_with_password(params)
      else
        params.delete(:current_password)
        resource.update_without_password(params)
      end
    end

    def configure_permitted_parameters
      allowed = %i[phone name password current_password]
      devise_parameter_sanitizer.permit(:account_update, keys: allowed)
    end

    def after_update_path_for(_resource)
      doctors_profile_path
    end
  end
end
