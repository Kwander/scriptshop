class UsersController < ApplicationController


def new

@user = User.new

end



def edit


@user = User.find(params[:id])

end


def index

@users = User.all

end

def users_params
	
	params.require(:user).permit(:username, :password, :email)
	end

def create

@user = User.new(users_params)
			
				if @user.save
				
				redirect_to users_path, :notice => "User created"
				flash[:notice] = "Welcome aboard!"
				flash[:color] = valid
				
				else
				 flash[:notice] = "Something went wrong - recheck the field, will you?"
                 flash[:color]= "invalid"
				
				render "new"
				
				end


end



def show

@user = User.find(params[:id])

end


def update

@user = User.find(params[:id])
	
		if @user.update_attributes(users_params)
		   redirect_to users_path, :notice => "User updated"
		else
		
		render "edit"
		end
		
		
end



def destroy

@user = User.find(params[:id])
@user.destroy
redirect_to scripts_path, :notice => "User deleted"

end





end
