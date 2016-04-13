class UsersController < ApplicationController
	def new
	 	@user = User.new 
	end

	def create
	 	@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'Cadastro efetuado com sucesso!'
			redirect_to action: "new"
		else
			render :new
		end
	end	
	#def show
				
	#end
	def user_params
		params[:user].permit(:name, :email, :password, :login, :dateBithday, :gender)
	end
end