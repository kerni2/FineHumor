# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
      respond_to do |format|
        format.html do
          @users = User.order(created_at: :desc).page params[:page]
        end
      end
    end

    def create
      if params[:archive].present?
        UserBulkService.call params[:archive]
        flash[:success] = 'Users imported!'
      end

      redirect_to admin_users_path
    end
  end
end
