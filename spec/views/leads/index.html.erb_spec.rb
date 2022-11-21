require 'rails_helper'

RSpec.describe "leads/index", type: :view do
  before(:each) do
    assign(:leads, [
      Lead.create!(
        full_name_contact: "Full Name Contact",
        company_name: "Company Name",
        email: "Email",
        phone: 2,
        project_name: "Project Name",
        project_description: "Project Description",
        departement_in_charge: "Departement In Charge",
        message: "Message",
        attached_file: ""
      ),
      Lead.create!(
        full_name_contact: "Full Name Contact",
        company_name: "Company Name",
        email: "Email",
        phone: 2,
        project_name: "Project Name",
        project_description: "Project Description",
        departement_in_charge: "Departement In Charge",
        message: "Message",
        attached_file: ""
      )
    ])
  end

  it "renders a list of leads" do
    render
    assert_select "tr>td", text: "Full Name Contact".to_s, count: 2
    assert_select "tr>td", text: "Company Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Project Name".to_s, count: 2
    assert_select "tr>td", text: "Project Description".to_s, count: 2
    assert_select "tr>td", text: "Departement In Charge".to_s, count: 2
    assert_select "tr>td", text: "Message".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
