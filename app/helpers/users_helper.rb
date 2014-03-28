module UsersHelper
  def get_coordinates
    current_user.ip_address = Geocoder.request.ip
    current_user.location = Geocoder.coordinates(current_user.ip_address)
    
  end
  
end
