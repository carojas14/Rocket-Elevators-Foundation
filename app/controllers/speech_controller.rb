require 'aws-sdk'
class SpeechController < ApplicationController

    def speech

        # initialize
        polly = Aws::Polly::Client.new(
            region: 'us-west-2',
            credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
        )

        # synthesize_speech
        message = polly.synthesize_speech(output_format: 'mp3', text: "Greetings.
        There are currently #{Elevator::count} elevators deployed in #{Building::count} buildings of your #{Customer::count} customers.
        Currently, #{Elevator.where.not(elevator_status: 'Active').count} elevators are not in Running Status and are being serviced.
        You currently have #{Quote::count} quotes awaiting processing.
        You currently have #{Lead::count} leads in your contact requests.
        #{Battery::count} Batteries are deployed across #{Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count} cities",
        voice_id: 'Joanna')

        puts message

        # update speech file
        IO.copy_stream(message.audio_stream, "speechResult.mp3")
        File.rename "speechResult.mp3", "public/speech.mp3"
    end
end