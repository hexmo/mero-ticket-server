# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :license_plate, :name, :phone, :description, :facility, :images, presence: true
  validates :license_plate, uniqueness: true

  enum facility: {
    deluxe: 'Deluxe',
    ac: 'A/C',
    air_suspension: 'Air Suspension',
    sleeper: 'Sleeper Coach'
  }
end
