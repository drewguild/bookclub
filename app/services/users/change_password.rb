module Users
    class ChangePassword
        def initialize(user, current_password, new_password, new_password_confirmation)
            @user = user
            @current_password = current_password
            @new_password = new_password
            @new_password_confirmation = new_password_confirmation
        end

        def call
            raise "Incorrect password" unless @user.authenticate(@current_password)
            raise "Passwords don't match" unless @new_password == @new_password_confirmation
            @user.password = @new_password
            @user.save!
        end
    end
end