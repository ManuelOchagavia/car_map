require 'test_helper'
require 'sidekiq/testing'

class Api::V1::GpsControllerTest < ActionDispatch::IntegrationTest
  test "should create gps with vehicle" do
    assert_difference("Vehicle.count",1 ) do
      assert_difference("Gp.count",1 ) do
        post "/api/v1/gps", params:  {vehicle_identifier: 'AA-0123', sent_at: "2020-10-15 22:13", longitude: -72.1234, latitude:-32.23423}
        Sidekiq::Worker.drain_all
      end
    end
  end

  test "should create just one vehicle" do
    assert_difference("Vehicle.count",1 ) do
      assert_difference("Gp.count",2 ) do
        post "/api/v1/gps", params:  {vehicle_identifier: 'AA-0123', sent_at: "2020-10-15 22:13", longitude: -72.1234, latitude:-32.23423}
        post "/api/v1/gps", params:  {vehicle_identifier: 'AA-0123', sent_at: "2020-10-15 23:13", longitude: -72.1234234, latitude:-32.223423}
        Sidekiq::Worker.drain_all
      end
    end
  end

  test "should not create vehicle nor gps" do
    assert_difference("Vehicle.count",0) do
      assert_difference("Gp.count",0 ) do
        post "/api/v1/gps", params:  {vehicle_identifier: 'A456fg{}?23', sent_at: "2020-10-15 22:13", longitude: -72.1234, latitude:-32.23423}
        Sidekiq::Worker.drain_all
      end
    end
  end
end
