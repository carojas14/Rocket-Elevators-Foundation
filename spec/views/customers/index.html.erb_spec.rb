require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
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
      ),
      Customer.create!(
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
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "Customer Creation Date".to_s, count: 2
    assert_select "tr>td", text: "Company Name".to_s, count: 2
    assert_select "tr>td", text: "Company Headquarter Adress".to_s, count: 2
    assert_select "tr>td", text: "Full Name Company Contact".to_s, count: 2
    assert_select "tr>td", text: "Company Contact Phone".to_s, count: 2
    assert_select "tr>td", text: "Email Company Contact".to_s, count: 2
    assert_select "tr>td", text: "Company Description".to_s, count: 2
    assert_select "tr>td", text: "Full Name Service Technical Auth".to_s, count: 2
    assert_select "tr>td", text: "Technical Authority Phone Service".to_s, count: 2
    assert_select "tr>td", text: "Technical Manager Email Service".to_s, count: 2
  end
end
