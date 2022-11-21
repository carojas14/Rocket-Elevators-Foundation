require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      CustomerCreationDate: "MyString",
      CompanyName: "MyString",
      CompanyHeadquarterAdress: "MyString",
      FullNameCompanyContact: "MyString",
      CompanyContactPhone: "MyString",
      EmailCompanyContact: "MyString",
      CompanyDescription: "MyString",
      FullNameServiceTechnicalAuth: "MyString",
      TechnicalAuthorityPhoneService: "MyString",
      TechnicalManagerEmailService: "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input[name=?]", "customer[CustomerCreationDate]"

      assert_select "input[name=?]", "customer[CompanyName]"

      assert_select "input[name=?]", "customer[CompanyHeadquarterAdress]"

      assert_select "input[name=?]", "customer[FullNameCompanyContact]"

      assert_select "input[name=?]", "customer[CompanyContactPhone]"

      assert_select "input[name=?]", "customer[EmailCompanyContact]"

      assert_select "input[name=?]", "customer[CompanyDescription]"

      assert_select "input[name=?]", "customer[FullNameServiceTechnicalAuth]"

      assert_select "input[name=?]", "customer[TechnicalAuthorityPhoneService]"

      assert_select "input[name=?]", "customer[TechnicalManagerEmailService]"
    end
  end
end
