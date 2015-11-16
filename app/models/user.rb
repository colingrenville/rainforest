class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews
	has_many :products, through: :reviews

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			redirect_to products_path
		else
			render :new
		end
	end

	private
	
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end


end
