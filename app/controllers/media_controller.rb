class MediaController < ApplicationController




def new
  # render the views/media/new.html.haml template
end

# def index
#   @media = Medium.all
# end

def show
  # if @current_user.id == params[:user_id]
  #   @medium = Medium.find(params[:id])
  # else
  #   redirect_to user_path
  # end
  @medium = Medium.find(params[:id])  
end

end