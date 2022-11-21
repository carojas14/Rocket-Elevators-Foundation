require 'rails_helper'

RSpec.describe "building_details/show", type: :view do
  before(:each) do
    @building_detail = assign(:building_detail, BuildingDetail.create!(
      building: nil,
      information_key: "Information Key",
      value: "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Information Key/)
    expect(rendered).to match(/Value/)
  end
end
