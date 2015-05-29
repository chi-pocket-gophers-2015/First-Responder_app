class PotholesController < ApplicationController
  def new
  end

  def new_form
    @pothole = Pothole.new
  end

  def create
    binding.pry
  end
end
