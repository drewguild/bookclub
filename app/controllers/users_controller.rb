class UsersController < ApplicationController
    def manage_account; end

    def update
        begin
            Users::ChangePassword.new(
                current_user,
                params[:current_password],
                params[:new_password],
                params[:new_password_confirmation]
            ).call
            
            flash[:success] = true
        rescue => e
            flash[:alert] = e.message
        end

        redirect_to account_path
    end
end