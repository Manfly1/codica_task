# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :set_category
  authorize_resource

  def index; end

  private

  def set_category
    @category = @categories.find_by(id: params[:category_id])
  end
end
