class FallbackController < ApplicationController::Base
  def index
    # React app index page
    render file: 'public/index.html'
  end
end
