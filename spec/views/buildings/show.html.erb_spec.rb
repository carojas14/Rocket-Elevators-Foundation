require 'rails_helper'

RSpec.describe "buildings/show", type: :view do
  before(:each) do
    @building = assign(:building, Building.create!(
      AdressBuilding: "Adress Building",
      FullNameBuildingAdmin: "Full Name Building Admin",
      EmailAdminBuilding: "Email Admin Building",
      PhoneNumberBuildingAdmin: "Phone Number Building Admin",
      FullNameTechContact: "Full Name Tech Contact",
      TechContactEmail: "Tech Contact Email",
      TechContactPhone: "Tech Contact Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Adress Building/)
    expect(rendered).to match(/Full Name Building Admin/)
    expect(rendered).to match(/Email Admin Building/)
    expect(rendered).to match(/Phone Number Building Admin/)
    expect(rendered).to match(/Full Name Tech Contact/)
    expect(rendered).to match(/Tech Contact Email/)
    expect(rendered).to match(/Tech Contact Phone/)
  end
end
