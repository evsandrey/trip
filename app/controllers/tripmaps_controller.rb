class TripmapsController < ApplicationController
  def trips
  	@trips = Trip.all
  end

  def fish
  	@trophyes=Trophy.all
  end

  def pictures
  	@pictures=Picture.where.not(lat: nil)
  end

end
