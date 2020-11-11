class Vehicle < ActiveRecord::Base
  attribute :sent_at
  validates :vehicle_identifier, format: { with: /\A([A-Z]{4}-\d{2}|[A-Z]{2}-\d{4})\z/, message: "Only AAAA-00 or AA-0000 format" }, presence: true
  has_many :gps
end
