class TripmapsController < ApplicationController
  def trips
  	@trips = Trip.all
  end

  def fish
  end

  def pictures
  end
end
