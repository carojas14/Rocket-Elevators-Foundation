require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      CustomerCreationDate: "Customer Creation Date",
      CompanyName: "Company Name",
      CompanyHeadquarterAdress: "Company Headquarter Adress",
      FullNameCompanyContact: "Full Name Company Contact",
      CompanyContactPhone: "Company Contact Phone",
      EmailCompanyContact: "Email Company Contact",
      CompanyDescription: "Company Description",
      FullNameServiceTechnicalAuth: "Full Name Service Technical Auth",
      TechnicalAuthorityPhoneService: "Technical Authority Phone Service",
      TechnicalManagerEmailService: "Technical Manager Email Service"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Customer Creation Date/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Company Headquarter Adress/)
    expect(rendered).to match(/Full Name Company Contact/)
    expect(rendered).to match(/Company Contact Phone/)
    expect(rendered).to match(/Email Company Contact/)
    expect(rendered).to match(/Company Description/)
    expect(rendered).to match(/Full Name Service Technical Auth/)
    expect(rendered).to match(/Technical Authority Phone Service/)
    expect(rendered).to match(/Technical Manager Email Service/)
  end
end
