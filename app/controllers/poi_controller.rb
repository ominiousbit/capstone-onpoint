class PoiController < ApplicationController
  def index
    @images = Image.all
    @poimanages = Poimanage.all
    @hash = Gmaps4rails.build_markers(@poimanages) do |poimanage, marker|
      marker.lat poimanage.latitude
      marker.lng poimanage.longitude
      des = "Title: "+poimanage.title+"<br />"+ "Description: "+poimanage.description
      marker.infowindow des
      marker.json({title: poimanage.title })
    end
  end
end
