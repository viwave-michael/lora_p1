class RollCall < ActiveRecord::Base
  belongs_to :device
  has_many :roll_call_answers
end
