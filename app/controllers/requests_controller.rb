class RequestsController < ApplicationController
  def new
  end

  def map

  end

  def new_form
    @request = Request.new
  end

  def create
    binding.pry
  end
end
