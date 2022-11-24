# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

require 'json'

file = File.read('addresses.json')

data_hash = JSON.parse(file)

data_hash['addresses'].each do |address|

address_type = ["HOME", "BUSINESS", "BILLING", "SHIPPING"]
address_status = ["ACTIVE", "INACTIVE"]
address_entity = ["RESIDENTIAL", "CORPORATE"]

battery_type = ["Residential", "Commercial", "Corporate", "Hybrid"]

####### ------- Create leads ------- ##########


leads = Lead.create(
    contactName: Faker::Name.name,
    contactBuisnessName: Faker::Company.name,
    contactEmail:  Faker::Internet.email,
    contactPhone: Faker::PhoneNumber.cell_phone,
    projectName: Faker::Company.catch_phrase,
    projectDescription: Faker::Lorem.sentence,
    contactDepartement: Faker::Lorem.sentence,
    message: Faker::Lorem.sentence,
    contactAttachment: 1,
    contactDate: Faker::Date.in_date_period
)

####### ------- Create Addresses ------- ##########


addresses = Address.create(
    type_address: address_type[rand(4)],
    status: address_status[rand(2)],
    entity: address_entity[rand(2)],
    number_and_street: address['address1'],
    suit_or_apartment: address['address2'],
    city: address['city'],
    postal_code: address['postalCode'],
    country: address["state"],
    notes: Faker::Lorem.paragraph,
    latitude: Address.geocoded[0],
    longitude: Address.geocoded[1],
)


    ####### ------- Create Users ------- ##########

    user = User.create([
        {email: "Houde@codeboxx.biz", password: "123456"},
        {email: "Thibault@codeboxx.biz", password: "123456"},
        {email: "Patry-Jessop@codeboxx.biz", password: "123456"},
        {email: "Amyot@codeboxx.biz", password: "123456"},
        {email: "Goupil@codeboxx.biz", password: "123456"},
        {email: "Boivin@codeboxx.biz", password: "123456"},
        {email: "Wever@codeboxx.biz", password: "123456"},
        {email: "Kleinerman@codeboxx.biz", password: "123456"},
        {email: "Hartono@codeboxx.biz", password: "123456"},
        {email: "Ai@codeboxx.biz", password: "123456"},
    ])


    user = User.create(
        email: Faker::Internet.email,
        password: '654321')
    


    ####### ------- Create Custumers ------- ##########

    customer = Customer.create(
        user_id: user.id,
        CustomerCreationDate: Faker::Date.in_date_period,
        CompanyName: Faker::Company.name,
        CompanyHeadquarterAdress: Faker::Address.full_address,
        FullNameCompanyContact: Faker::Name.name,
        CompanyContactPhone: Faker::PhoneNumber.cell_phone,
        EmailCompanyContact: Faker::Internet.email,
        CompanyDescription: Faker::Lorem.sentence,
        FullNameServiceTechnicalAuth: Faker::Name.name,
        TechnicalAuthorityPhoneService: Faker::PhoneNumber.cell_phone,
        TechnicalManagerEmailService: Faker::Internet.email
    )


    ####### ------- Create Buildings ------- ##########
# THIS IS THE GOOD VERSION, THE NAMES CHANGE ARE NECESSARY FOR THE GOOGLE API TO FUNCTION
    full_address = addresses.number_and_street + " " + addresses.city,
    name = Faker::Name.name
    email = Faker::Internet.email
    phone1 = Faker::PhoneNumber.cell_phone
    name2 = Faker::Name.name
    email2 = Faker::Internet.email
    phone2 = Faker::PhoneNumber.cell_phone
    building = Building.create(
        customer_id: customer.id,
        address_id: addresses.id,
        addressBuilding: full_address,
        FullNameBuildingAdmin: name,
        EmailAdminBuilding: email,
        PhoneNumberBuildingAdmin: phone1,
        FullNameTechContact: name2,
        TechContactEmail: email2,
        TechContactPhone: phone2
    )


    ####### ------- Create Batteries ------- ##########

    battery = Battery.create(
        building_id: building.id,
        battery_type: battery_type[rand(4)],
        status: ["Active", "Inactive"].sample,
        employee_id: Faker::Number.between(from: 1, to: 10),
        date_commissioning: Faker::Date.in_date_period,
        date_last_inspection: Faker::Date.in_date_period,
        certificate_operations: Faker::Lorem.sentence,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )


    ####### ------- Create Columns ------- ##########

    columns = Column.create(
        battery_id: battery.id,
        column_type: ['residential', 'commercial', 'corporate', 'hybrid'].sample,
        served_floors_nb: Faker::Number.number(digits: 6),
        status: ["Active", "Inactive"].sample,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )


    ####### ------- Create BuildingDetails ------- ##########

    random = rand(2)
    key = ""

    if random == 1
        key = "type"
    else
        key = "construction year"
        value = Faker::Number.between(from: 1900, to: 2020)
    end


        building_details = BuildingDetail.create(
            building_id: building.id,
            # information_key: Faker::Lorem.sentence,
            # value: Faker::Lorem.sentence
            information_key: key,
            value: value
            )


    ####### ------- Create Elevators ------- ##########

    elevators = Elevator.create(
        column_id: columns.id,
        serial_nb: Faker::Number.number(digits: 6),
        model: Faker::Commerce.brand,
        elevator_type: Faker::Types.rb_string,
        elevator_status: ["Active", "Inactive"].sample,
        date_commissioning: Faker::Date.in_date_period,
        date_last_inspection: Faker::Date.in_date_period,
        certificate_inspection: Faker::Commerce.brand,
        information: Faker::Company.catch_phrase,
        notes: Faker::Quote.yoda
    )

end
    ####### ------- Create Employees ------- ##########
    
    
    employees = Employee.create([
        {lastName: "Houde", firstName: "Mathieu", title: "Gopher"},
        {lastName: "Thibault", firstName: "Patrick", title: "Maximalist"},
        {lastName: "Patry-Jessop", firstName: "Francis", title: "Captain"},
        {lastName: "Amyot", firstName: "David", title: "The Man"},
        {lastName: "Goupil", firstName: "Marie-Ève", title: "Al Master"},
        {lastName: "Boivin", firstName: "François", title: "The Tank"},
        {lastName: "Wever", firstName: "Timothy", title: "Beard whisperer"},
        {lastName: "Kleinerman", firstName: "Kiril", title: "I <3 Winnipeg"},
        {lastName: "Hartono", firstName: "Felicia", title: "Scrums are too early"},
        {lastName: "Ai", firstName: "Eileen", title: "They really are"},
    ])
