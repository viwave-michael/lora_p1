class Path < ActiveRecord::Base
  belongs_to :device
  has_many :positions
end
