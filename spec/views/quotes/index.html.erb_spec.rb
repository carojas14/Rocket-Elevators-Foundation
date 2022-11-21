require 'rails_helper'

RSpec.describe "quotes/index", type: :view do
  before(:each) do
    assign(:quotes, [
      Quote.create!(
        buildingType: "Building Type",
        nbrAppBuild: 2,
        nbrFloorsR: 3,
        nbrFloorsC: 4,
        nbrFloorsCor: 5,
        nbrFloorsH: 6,
        nbrBasementFloorsR: 7,
        nbrBasementFloorsC: 8,
        nbrBasementFloorsCor: 9,
        nbrBasementFloorsH: 10,
        nbrDisBuiCor: 11,
        nbrDisBuiH: 12,
        nbrParkingC: 13,
        nbrParkingCor: 14,
        nbrParkingH: 15,
        nbrElevatorCages: 16,
        nbrOccPerFloorCor: 17,
        nbrOccPerFloorH: 18,
        nbrActPerDay: 19,
        serviceType: "Service Type"
      ),
      Quote.create!(
        buildingType: "Building Type",
        nbrAppBuild: 2,
        nbrFloorsR: 3,
        nbrFloorsC: 4,
        nbrFloorsCor: 5,
        nbrFloorsH: 6,
        nbrBasementFloorsR: 7,
        nbrBasementFloorsC: 8,
        nbrBasementFloorsCor: 9,
        nbrBasementFloorsH: 10,
        nbrDisBuiCor: 11,
        nbrDisBuiH: 12,
        nbrParkingC: 13,
        nbrParkingCor: 14,
        nbrParkingH: 15,
        nbrElevatorCages: 16,
        nbrOccPerFloorCor: 17,
        nbrOccPerFloorH: 18,
        nbrActPerDay: 19,
        serviceType: "Service Type"
      )
    ])
  end

  it "renders a list of quotes" do
    render
    assert_select "tr>td", text: "Building Type".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
    assert_select "tr>td", text: 8.to_s, count: 2
    assert_select "tr>td", text: 9.to_s, count: 2
    assert_select "tr>td", text: 10.to_s, count: 2
    assert_select "tr>td", text: 11.to_s, count: 2
    assert_select "tr>td", text: 12.to_s, count: 2
    assert_select "tr>td", text: 13.to_s, count: 2
    assert_select "tr>td", text: 14.to_s, count: 2
    assert_select "tr>td", text: 15.to_s, count: 2
    assert_select "tr>td", text: 16.to_s, count: 2
    assert_select "tr>td", text: 17.to_s, count: 2
    assert_select "tr>td", text: 18.to_s, count: 2
    assert_select "tr>td", text: 19.to_s, count: 2
    assert_select "tr>td", text: "Service Type".to_s, count: 2
  end
end
