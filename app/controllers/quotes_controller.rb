class QuotesController < ApplicationController
  require 'rubygems'
  require 'rest-client'
  require 'json'

  def request_quote
    
  end

  def create
    quote = Quote.new
    quote.buildingType = params[:type_of_building]
    quote.nbrAppBuild = params[:nbrAppBuild]
    quote.nbrFloorsR = params[:nbrFloorsR]
    quote.nbrFloorsC = params[:nbrFloorsC]
    quote.nbrFloorsCor = params[:nbrFloorsCor]
    quote.nbrFloorsH = params[:nbrFloorsH]
    quote.nbrBasementFloorsR = params[:nbrBasementsFloorsR]
    quote.nbrBasementFloorsC = params[:nbrBasementsFloorsC]
    quote.nbrBasementFloorsCor = params[:nbrBasementsFloorsCor]
    quote.nbrBasementFloorsH = params[:nbrBasementsFloorsH]
    quote.nbrDisBuiCor = params[:nbrDisBuiC]
    quote.nbrDisBuiH = params[:nbrDisBuiH]
    quote.nbrParkingC = params[:nbrParkingC]
    quote.nbrParkingCor = params[:nbrParkingCor]
    quote.nbrParkingH = params[:nbrParkingH]
    quote.nbrElevatorCages = params[:nbrElevatorCages]
    quote.nbrOccPerFloorCor = params[:nbrOccPerFloorCor]
    quote.nbrOccPerFloorH = params[:nbrOccPerFloorH]
    quote.nbrActPerDay = params[:nbrActPerDay]
    quote.serviceType = params[:serviceType]

    quote.save

    flash[:success] = "New to-do item successfully added!"

    # ------- FreshDesk -------

    # Your freshdesk domain
    freshdesk_domain = 'rocketelevatorscanada'

    # It could be either your user name or api_key.
    user_name_or_api_key = Figaro.env.FRESHDESK_API_KEY
    user_name_or_api_key = ENV['FRESHDESK_API_KEY']

    # If you have given api_key, then it should be x. If you have given user name, it should be password
    password_or_x = 'x'

    #attachments should be of the form array of Hash with files mapped to the key 'resource'.
    multipart_payload = JSON.generate({ status: 2,

                  priority: 1,
                  type: "Feature Request",
                  email: "info@rocketelevatorscanada.com",
                  description: " <br><br>
                  TYPE OF BUILDING: #{quote.buildingType}
                  <br><br>
                  -------------------------------------------------------------
                  <br>
                  nbrAppartementBuilding: #{quote.nbrAppBuild}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrFloorsResidential: #{quote.nbrFloorsR}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrFloorsCommercial: #{quote.nbrFloorsC}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrFloorsCorporate: #{quote.nbrFloorsCor}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrFloorsHybrid: #{quote.nbrFloorsH}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrBasementFloorsResidential: #{quote.nbrBasementFloorsR}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrBasementFloorsCommercial: #{quote.nbrBasementFloorsC}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrBasementFloorsCorporate: #{quote.nbrBasementFloorsR}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrBasementFloorsHybrid: #{quote.nbrBasementFloorsR}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrDisBuiCorporate: #{quote.nbrDisBuiCor}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrDisBuiHybrid: #{quote.nbrDisBuiH}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrParkingCommercial: #{quote.nbrParkingC}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrParkingCorporate: #{quote.nbrParkingCor}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrParkingHybrid: #{quote.nbrParkingH}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrElevatorCages: #{quote.nbrElevatorCages}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrOccPerFloorCorporate: #{quote.nbrOccPerFloorCor}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrOccPerFloorHybrid: #{quote.nbrOccPerFloorH}
                  <br>
                  -------------------------------------------------------------
                  <br>
                  nbrActPerDay: #{quote.nbrActPerDay}
                  
                  ",
                  subject: "New quote #{Time.now} "

    })

    freshdesk_api_path = 'api/v2/tickets'

    freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

    site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)

    begin
      response = site.post(multipart_payload, :content_type => 'application/json')
      puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
      rescue RestClient::Exception => exception
      puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
      puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
      puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
    end


  end
end