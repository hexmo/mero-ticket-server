# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :vehicle

  validates :start_location, :end_location, :eta, :journery_date, :journey_time, :ticket_price, presence: true

  validate :check_start_and_end_location

  def check_start_and_end_location
    errors.add(:end_location, "can't be same as start location") if start_location == end_location
  end

  enum start_location: {
    kathmandu: 'Kathmandu',
    pokhara: 'Pokhara',
    birtamod: 'Birtamod',
    illam: 'Illam',
    birgunj: 'Birgunj',
    solukhumbu: 'Solukhumbu',
    biratnagar: 'Biratnagar',
    butwal: 'Butwal',
    ithari: 'Ithari',
    nepalgunj: 'Nepalgunj',
    dang: 'Dang',
    kailali: 'Kailali'
  }, _suffix: true

  enum end_location: {
    kathmandu: 'Kathmandu',
    pokhara: 'Pokhara',
    birtamod: 'Birtamod',
    illam: 'Illam',
    birgunj: 'Birgunj',
    solukhumbu: 'Solukhumbu',
    biratnagar: 'Biratnagar',
    butwal: 'Butwal',
    ithari: 'Ithari',
    nepalgunj: 'Nepalgunj',
    dang: 'Dang',
    kailali: 'Kailali'
  }, _suffix: true
end
