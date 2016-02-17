class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				flash[:notice] = I18n.t("user._entity_updated_success")
				format.html { redirect_to @user }
			else
				flash[:alert] = I18n.t("user._entity_updated_fail")
				format.html { render :edit  }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @user.destroy
				flash[:notice] = I18n.t("user._entity_destroyed_success")
				format.html { render :index }
			else
				flash[:alert] = I18n.t("user._entity_destroyed_fail")
				format.html { render :edit  }
			end
		end
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:role, :user_name)
		end
end
