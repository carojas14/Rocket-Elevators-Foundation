require 'rails_helper'

RSpec.describe "building_details/index", type: :view do
  before(:each) do
    assign(:building_details, [
      BuildingDetail.create!(
        building: nil,
        information_key: "Information Key",
        value: "Value"
      ),
      BuildingDetail.create!(
        building: nil,
        information_key: "Information Key",
        value: "Value"
      )
    ])
  end

  it "renders a list of building_details" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Information Key".to_s, count: 2
    assert_select "tr>td", text: "Value".to_s, count: 2
  end
end
