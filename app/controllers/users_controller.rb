class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Hey #{@user.username}, welcome to bloggy"
             redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
      @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
            flash[:success] = "Account was updated successfully"
            redirect_to articles_path
          else
            render "edit"
          end

    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end