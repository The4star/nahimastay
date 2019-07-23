class ApplicationController < ActionController::Base
    before_action :authenticate_user!, only: [:create, :update, :destroy, :new]
end
