# frozen_string_literal: true

module Doctors
  class ProfilesController < ApplicationController
    def show
      authorize! :read, current_doctor
    end
  end
end
