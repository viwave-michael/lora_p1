class HelpCall < ActiveRecord::Base
  belongs_to :device
  has_many :help_call_answers
end
