class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  respond_to :html, :json

  require 'rest-client'
  require 'json'

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
    @customers = Customer.all
    @employee = Employee.all
    @author = current_user.id


  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save

        author = Employee.find(@intervention.Author)
        authorName = author.firstName + " " + author.lastName
        customer = Customer.find(@intervention.CustomerID)
        customerName = customer.CompanyName
        employee = Employee.find(@intervention.EmployeeID)
        employeeName = employee.firstName + " " + employee.lastName

        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }


              # ------- FreshDesk -------

        # Your freshdesk domain
        freshdesk_domain = 'codeboxx-assist'

        # It could be either your user name or api_key.
        user_name_or_api_key = ENV['FRESHDESK_API_KEY']

        # If you have given api_key, then it should be x. If you have given user name, it should be password
        password_or_x = 'x'

        #attachments should be of the form array of Hash with files mapped to the key 'resource'.
        multipart_payload = JSON.generate({
                      status: 2,
                      priority: 1,
                      type: "Incident",
                      email: "support@codeboxx-assist.freshdesk.com",
                      description:
                      "Requester: " + authorName + ",\n
                      Client: " + customerName + ",\n
                      Building ID: #{@intervention.BuildingID},\n
                      Battery ID: #{@intervention.BatteryID},\n
                      Column ID: #{@intervention.ColumnID},\n
                      Elevator ID: #{@intervention.ElevatorID},\n
                      Assigned Employee: " + employeeName + ",\n
                      Description: #{@intervention.Report}",
                      subject: "New intervention submitted for building No." + @intervention.BuildingID.to_s

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


      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      # params.fetch(:intervention, {})
      params.require(:intervention).permit(:Author, :CustomerID, :BuildingID, :BatteryID, :ColumnID, :ElevatorID, :EmployeeID, :Report)
    end
end
