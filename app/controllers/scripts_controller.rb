class ScriptsController < ApplicationController


def new

@script = Script.new

end



def edit


@script = Script.find(params[:id])

end


def index

@scripts = Script.all

end

def scripts_params
	
	params.require(:script).permit(:title, :description, :price)
	end

def create

@script = Script.new(scripts_params)
			
				if @script.save
				
				redirect_to scripts_path, :notice => "Script published"
				
				else
				
				render "new"
				
				end


end



def show

@script = Script.find(params[:id])

end


def update

@script = Script.find(params[:id])
	
		if @script.update_attributes(scripts_params)
		   redirect_to scripts_path, :notice => "Script updated"
		else
		
		render "edit"
		end
		
		
end



def destroy


@script = Script.find(params[:id]) # find the article
	@script.destroy
	redirect_to scripts_path, :notice => "Script deleted"

end


end
