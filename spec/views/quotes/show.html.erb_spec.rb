require 'rails_helper'

RSpec.describe "quotes/show", type: :view do
  before(:each) do
    @quote = assign(:quote, Quote.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Building Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/15/)
    expect(rendered).to match(/16/)
    expect(rendered).to match(/17/)
    expect(rendered).to match(/18/)
    expect(rendered).to match(/19/)
    expect(rendered).to match(/Service Type/)
  end
end
