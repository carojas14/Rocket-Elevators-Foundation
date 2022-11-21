require 'rails_helper'

RSpec.describe "buildings/edit", type: :view do
  before(:each) do
    @building = assign(:building, Building.create!(
      AdressBuilding: "MyString",
      FullNameBuildingAdmin: "MyString",
      EmailAdminBuilding: "MyString",
      PhoneNumberBuildingAdmin: "MyString",
      FullNameTechContact: "MyString",
      TechContactEmail: "MyString",
      TechContactPhone: "MyString"
    ))
  end

  it "renders the edit building form" do
    render

    assert_select "form[action=?][method=?]", building_path(@building), "post" do

      assert_select "input[name=?]", "building[AdressBuilding]"

      assert_select "input[name=?]", "building[FullNameBuildingAdmin]"

      assert_select "input[name=?]", "building[EmailAdminBuilding]"

      assert_select "input[name=?]", "building[PhoneNumberBuildingAdmin]"

      assert_select "input[name=?]", "building[FullNameTechContact]"

      assert_select "input[name=?]", "building[TechContactEmail]"

      assert_select "input[name=?]", "building[TechContactPhone]"
    end
  end
end
