require 'rails_helper'

RSpec.describe "leads/new", type: :view do
  before(:each) do
    assign(:lead, Lead.new(
      full_name_contact: "MyString",
      company_name: "MyString",
      email: "MyString",
      phone: 1,
      project_name: "MyString",
      project_description: "MyString",
      departement_in_charge: "MyString",
      message: "MyString",
      attached_file: ""
    ))
  end

  it "renders new lead form" do
    render

    assert_select "form[action=?][method=?]", leads_path, "post" do

      assert_select "input[name=?]", "lead[full_name_contact]"

      assert_select "input[name=?]", "lead[company_name]"

      assert_select "input[name=?]", "lead[email]"

      assert_select "input[name=?]", "lead[phone]"

      assert_select "input[name=?]", "lead[project_name]"

      assert_select "input[name=?]", "lead[project_description]"

      assert_select "input[name=?]", "lead[departement_in_charge]"

      assert_select "input[name=?]", "lead[message]"

      assert_select "input[name=?]", "lead[attached_file]"
    end
  end
end
