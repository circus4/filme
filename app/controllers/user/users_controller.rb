class User::UsersController < ApplicationController
    def destroy_check
    end

    def edit
      @user = current_user
    end

    def update
      user=User.find(params[:id])
      user.update(user_params)
      redirect_to edit_user_path(user.id)
    end

    private

    def user_params
      params.require(:user).permit(:image,:phonetic_name,:name,:email,:postal_code,:prefecture,
                                   :city,:adress,:phone_number)
    end
end
