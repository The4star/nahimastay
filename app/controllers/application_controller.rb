class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new]

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render "layouts/pundit_error"
  end
end
