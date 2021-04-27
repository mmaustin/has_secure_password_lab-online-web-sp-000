class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by_name(session_params.values[0])

        if session_params.values[1] == "" || !user.authenticate(session_params.values[1])
            redirect_to new_session_path
        else
            session[:user_id] = user.id
            redirect_to '/'
        end

    end

    private

    def session_params
        params.require(:user).permit(:name, :password) 
    end

end