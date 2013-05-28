class Location < ActiveRecord::Base
  attr_accessible :address, :club_name, :gmaps, :latitude, :longitude, :logo

  acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    address
  end

  def gmaps4rails_infowindow
    "<h5 class='gmap_title'>#{club_name}</h5>"
    #"<img class='logo' src='/images/#{logo}'/>"
  end

  #def gmaps4rails_marker_picture
  #  {
  #      "picture" => "/images/#{logo}",
  #      "width" => 20,
  #      "height" => 20
  #  }
  #end

end
