class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_google_maps_javascript_api_key

  def set_google_maps_javascript_api_key
    # Load the google maps javascript API key
    file_lines = []
    File.open('secrets.txt','r') do |f|
        f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
    end
    @javascript_maps_api_key = file_lines[2]
  end
end
