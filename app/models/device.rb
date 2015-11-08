class Device < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :paths
  has_many :roll_calls
end
