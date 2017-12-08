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


def create
  @medium = Medium.new(medium_params)
  
  if @medium.save
      redirect_to user_path(current_user[:id]), notice: 'Medium was successfully created.'
  else
      render action: 'new'
  end
end

private

def medium_params
    params.require(:medium).permit(:image, :name)
end

end