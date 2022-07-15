class MainController < ApplicationController
  def index
    flash.now[:notice] = 'Logged in successfully'
    flash.now[:gumtha] = 'Invalid username or password'
  end
end