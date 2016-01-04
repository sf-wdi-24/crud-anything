class WelcomeController < ApplicationController

  def home_page
    @photos = Photo.first(6)
  end
  
end
