require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test "check vehicle correct identifier" do 
    vehicle = Vehicle.create(vehicle_identifier: "AA-3212", sent_at: "2020-12-11 20:12", 
                        longitude: -32.178, latitude: -73.16)
    assert vehicle.valid?
    vehicle = Vehicle.create(vehicle_identifier: "A3}{+212", sent_at: "2020-12-11 20:12", 
                        longitude: -32.178, latitude: -73.16)
    assert_not vehicle.valid? 
  end
end
