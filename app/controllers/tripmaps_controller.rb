class TripmapsController < ApplicationController
  def trips
  	@trips = Trip.all
  end

  def fish
  	@q = Trophy.ransack(params[:q])
    @trophies = @q.result(distinct: true).includes(:fish, :bait, :trip).paginate(:page => params[:page], :per_page => 20)
  end

  def pictures
  	@pictures=Picture.where.not(lat: nil)
  end

end
