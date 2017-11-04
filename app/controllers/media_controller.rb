class MediaController < ApplicationController




def new
  # render the views/media/new.html.haml template
end

# def index
#   @media = Medium.all
# end

def show
  id = params[:user_id]
  @medium = Medium.find(id)
end

end