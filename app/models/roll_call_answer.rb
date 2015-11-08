class RollCallAnswer < ActiveRecord::Base
  belongs_to :roll_call
  belongs_to :device
end
