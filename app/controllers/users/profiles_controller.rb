# frozen_string_literal: true

module Users
  class ProfilesController < ApplicationController
    def show
      authorize! :read, current_user
    end
  end
end
