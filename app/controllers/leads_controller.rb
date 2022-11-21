class LeadsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  require 'rubygems'
  require 'rest-client'
  require 'json'

  require 'date'
  def create
      leads = Lead.new

      leads.contactName = params[:contactName]
      leads.contactEmail = params[:contactEmail]
      leads.contactPhone = params[:contactPhone]
      leads.contactBuisnessName = params[:contactBuisnessName]
      leads.contactDepartement = params[:contactDepartement]
      leads.projectName = params[:contactProject]
      leads.message = params[:contactMessage]
      leads.contactAttachment = params[:contactAttachment]

      current_time = DateTime.now

      leads.contactDate = current_time.strftime "%d/%m/%Y"

      
      flash[:success] = "Request successfully sent!"

      # ------- SendGrid -------

      from = Email.new(email: 'mlouellette31@gmail.com')
      to = Email.new(email: leads.contactEmail)
      subject = 'Thanks for contacting The Rocket Team!'
      content = Content.new(type: 'text/html', value: 'Greetings ' + leads.contactName +   '<br> 
          We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project ' + leads.projectName +
          '<br><br>
          
          A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
          <br><br>
  
          We’ll Talk soon,
          <br>
          The Rocket Team
          <br>
          <img src="https://rocketelevatorscanada.com/assets/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png" width="200" height="100">')
      

      mail = Mail.new(from, subject, to, content)
      

      puts mail.to_json
      
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers

      
      # ------- FreshDesk -------

      # Your freshdesk domain
      freshdesk_domain = 'rocketelevatorscanada'

      # It could be either your user name or api_key.
      user_name_or_api_key = ENV['FRESHDESK_API_KEY']

      # If you have given api_key, then it should be x. If you have given user name, it should be password
      password_or_x = 'x'

      #attachments should be of the form array of Hash with files mapped to the key 'resource'.
      multipart_payload = JSON.generate({ status: 2,

                    priority: 1,
                    type: "Question",
                    email: leads.contactEmail,
                    description: "The contact #{leads.contactName} from company #{leads.contactBuisnessName} can be reached at email #{leads.contactEmail} and at phone number #{leads.contactPhone}. #{leads.contactDepartement} has a project named #{leads.projectName} which would require contribution from Rocket Elevators.
                    <br><br>
                    #{leads.message} 
                    <br><br>
                    Attached Message: #{leads.contactAttachment}",
                    subject: "#{leads.contactName} from #{leads.contactBuisnessName} #{Time.now} "

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