class MediaController < ApplicationController




def new
  # render the views/media/new.html.haml template
end

# def index
#   @media = Medium.all
# end

def show
  m = Medium.where(:id=>params[:id], :user_id=>current_user[:id])
  if m.length == 1
    @medium = m[0]
  else
    redirect_to user_path(current_user[:id])
  end
end

end