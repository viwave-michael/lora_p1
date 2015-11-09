class HelpCallAnswer < ActiveRecord::Base
  belongs_to :device
  belongs_to :help_call
end
