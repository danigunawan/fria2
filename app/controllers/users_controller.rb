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
		puts "++++"
		puts "++++"
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
end
