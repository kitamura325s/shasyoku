class Cafeteria < ActiveRecord::Base
    before_save :geocode_address
    belongs_to :user
    has_many :pictures

    def geocode_address
      coords = Geocoder.coordinates(
        self.address
      )
      self.latitude = coords[0]
      self.longitude = coords[1]
    end
end
