class WelcomeController < ApplicationController
  def index
    backend = Backend.new
    @data = backend.data
  end
end
