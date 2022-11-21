require 'rails_helper'

RSpec.describe "leads/show", type: :view do
  before(:each) do
    @lead = assign(:lead, Lead.create!(
      full_name_contact: "Full Name Contact",
      company_name: "Company Name",
      email: "Email",
      phone: 2,
      project_name: "Project Name",
      project_description: "Project Description",
      departement_in_charge: "Departement In Charge",
      message: "Message",
      attached_file: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name Contact/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Project Name/)
    expect(rendered).to match(/Project Description/)
    expect(rendered).to match(/Departement In Charge/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(//)
  end
end
