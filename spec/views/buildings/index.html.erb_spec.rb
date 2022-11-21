require 'rails_helper'

RSpec.describe "buildings/index", type: :view do
  before(:each) do
    assign(:buildings, [
      Building.create!(
        AdressBuilding: "Adress Building",
        FullNameBuildingAdmin: "Full Name Building Admin",
        EmailAdminBuilding: "Email Admin Building",
        PhoneNumberBuildingAdmin: "Phone Number Building Admin",
        FullNameTechContact: "Full Name Tech Contact",
        TechContactEmail: "Tech Contact Email",
        TechContactPhone: "Tech Contact Phone"
      ),
      Building.create!(
        AdressBuilding: "Adress Building",
        FullNameBuildingAdmin: "Full Name Building Admin",
        EmailAdminBuilding: "Email Admin Building",
        PhoneNumberBuildingAdmin: "Phone Number Building Admin",
        FullNameTechContact: "Full Name Tech Contact",
        TechContactEmail: "Tech Contact Email",
        TechContactPhone: "Tech Contact Phone"
      )
    ])
  end

  it "renders a list of buildings" do
    render
    assert_select "tr>td", text: "Adress Building".to_s, count: 2
    assert_select "tr>td", text: "Full Name Building Admin".to_s, count: 2
    assert_select "tr>td", text: "Email Admin Building".to_s, count: 2
    assert_select "tr>td", text: "Phone Number Building Admin".to_s, count: 2
    assert_select "tr>td", text: "Full Name Tech Contact".to_s, count: 2
    assert_select "tr>td", text: "Tech Contact Email".to_s, count: 2
    assert_select "tr>td", text: "Tech Contact Phone".to_s, count: 2
  end
end
