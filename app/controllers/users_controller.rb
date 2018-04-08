class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def view
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def edit_profile
		@user = current_user
	end

	def edited_profile
		@user = User.find(params[:id])
		if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      		bypass_sign_in(@user)
      		redirect_to home_page_path

      	else
      		render "edit_profile"
    	end


	end

	def add_dean
		@user = User.find(params[:id])
		@user.dean.activated = true
		@user.dean.save!
		@user.save!
		redirect_to edit_account_path
	end

	def add_committee_head
		@user = User.find(params[:id])
		@user.committee_head.activated = true
		@user.committee_head.save!
		@user.save!
		redirect_to edit_account_path
	end

	def add_committee_member
		@user = User.find(params[:id])
		@user.committee_member.activated = true
		@user.committee_member.save!
		@user.save!
		redirect_to edit_account_path
	end

	def add_researcher
		@user = User.find(params[:id])
		@user.researcher.activated = true
		@user.researcher.save!
		@user.save!
		redirect_to edit_account_path
	end

	def add_admin
		@user = User.find(params[:id])
		@user.admin.activated = true
		@user.admin.save!
		@user.save!
		redirect_to edit_account_path
	end

	def remove_dean
		@user = User.find(params[:id])
		@user.dean.activated = false
		@user.dean.save!
		@user.save!
		redirect_to edit_account_path
	end

	def remove_committee_head
		@user = User.find(params[:id])
		@user.committee_head.activated = false
		@user.committee_head.save!
		@user.save!
		redirect_to edit_account_path
	end

	def remove_committee_member
		@user = User.find(params[:id])
		@user.committee_member.activated = false
		@user.committee_member.save!
		@user.save!
		redirect_to edit_account_path
	end

	def remove_researcher
		@user = User.find(params[:id])
		@user.researcher.activated = false
		@user.researcher.save!
		@user.save!
		puts "++++"
		puts "++++"
		redirect_to edit_account_path
	end

	def remove_admin
		@user = User.find(params[:id])
		@user.admin.activated = false
		@user.admin.save!
		@user.save!
		redirect_to edit_account_path
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :department, :rank, :contact_number, :email, :password, :password_confirmation, :current_password)
	end
end
