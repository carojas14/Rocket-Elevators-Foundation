require 'twilio-ruby'
require 'slack-ruby-client'
class Elevator < ApplicationRecord
    # belongs_to :column, class_name: "Column", foreign_key: "column_id"
    belongs_to :column
    # before_save :intervention
    before_update :intervention, :twilio_sms

    def intervention
        if self.elevator_status_changed?
            puts "%%%%%%%%%%%%%%%%"
            client = Slack::Web::Client.new 
            texte = "The Elevator #{self.id} with Serial Number #{self.serial_nb} changed status from #{self.elevator_status_was} to #{self.elevator_status}"
            client.chat_postMessage(channel: '#eileen-elevator_operations', text: texte, as_user: true)
        end
    end

    def twilio_sms
        if self.elevator_status_changed?
            # if self.elevator_status == 'Intervention'
                # put your own credentials here
            account_sid = ENV['TWILIO_ACCOUNT_SID']
            auth_token = ENV['TWILIO_AUTH_TOKEN']
            puts "$$$$$$$$$$$$"
            # set up a client to talk to the Twilio REST API
            @client = Twilio::REST::Client.new(account_sid, auth_token)
             twilio_phone = ENV['TWILIO_PHONE_NUMBER']
             message = @client.messages.create(
                     body: 'Elevator #{self.id} with Serial Number #{self.serial_nb} requires maintenance.',
                     from: twilio_phone,
                     to: '+15147131412'
                 )
            # end
        end
    end

end