class MediaController < ApplicationController

def medium_params
    params.require(:medium).permit(:name, :note)
end


def new
  # render the views/media/new.html.haml template
end

# def index
#   @media = Medium.all
# end

def create
  if params[:medium][:image] != nil
    p "got #{params[:medium][:image].path} for path"
    
    require 'aws-sdk'
    
    Aws.config.update({
      region: 'us-east-1',
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    })
    
    # Set these environment vars instead:
    # 
    # heroku config:set AWS_ACCESS_KEY_ID='xxx'
    # heroku config:set AWS_SECRET_ACCESS_KEY='xxx'
    # heroku config:set AWS_REGION='us-east-1'
    
    # file_name = params[:medium][:image].original_filename
    file_name = rand(36**32).to_s(36) + '.png'
    upload_file = params[:medium][:image].path
    
    # Create an instance of the Aws::S3::Resource class
    s3 = Aws::S3::Resource.new
    # Reference the target object by bucket name and key.
    # Objects live in a bucket and have unique keys that identify the object.
    obj = s3.bucket('selt').object(file_name)
    obj.upload_file(upload_file, { acl: 'public-read' })  # http://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html
    
    # Returns Public URL to the file
    p "public url #{obj.public_url}"
    mp = medium_params
    mp[:photoUrl] = obj.public_url
    
    puts "************************"
  elsif params[:medium][:note].empty?
    flash[:warning] = "You have to either write a text or upload a photo to submit the post."
    redirect_to root_path and return
  else  
    mp = medium_params
  end
    
    
  
  
  mp[:user_id] = current_user[:id]
 
  mp[:latitude] = current_user[:latitude]
  mp[:longitude] = current_user[:longitude]  
  
  @medium = Medium.new(mp)
  
  if @medium.save
      redirect_to user_path(current_user[:id]), notice: 'Medium was successfully created.'
  else
      render action: 'new'
  end
end

def show
  m = Medium.where(:id=>params[:id], :user_id=>current_user[:id])
  if m.length == 1
    @medium = m[0]
  else
    redirect_to user_path(current_user[:id])
  end
end

private

end