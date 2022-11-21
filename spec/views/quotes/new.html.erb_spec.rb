require 'rails_helper'

RSpec.describe "quotes/new", type: :view do
  before(:each) do
    assign(:quote, Quote.new(
      buildingType: "MyString",
      nbrAppBuild: 1,
      nbrFloorsR: 1,
      nbrFloorsC: 1,
      nbrFloorsCor: 1,
      nbrFloorsH: 1,
      nbrBasementFloorsR: 1,
      nbrBasementFloorsC: 1,
      nbrBasementFloorsCor: 1,
      nbrBasementFloorsH: 1,
      nbrDisBuiCor: 1,
      nbrDisBuiH: 1,
      nbrParkingC: 1,
      nbrParkingCor: 1,
      nbrParkingH: 1,
      nbrElevatorCages: 1,
      nbrOccPerFloorCor: 1,
      nbrOccPerFloorH: 1,
      nbrActPerDay: 1,
      serviceType: "MyString"
    ))
  end

  it "renders new quote form" do
    render

    assert_select "form[action=?][method=?]", quotes_path, "post" do

      assert_select "input[name=?]", "quote[buildingType]"

      assert_select "input[name=?]", "quote[nbrAppBuild]"

      assert_select "input[name=?]", "quote[nbrFloorsR]"

      assert_select "input[name=?]", "quote[nbrFloorsC]"

      assert_select "input[name=?]", "quote[nbrFloorsCor]"

      assert_select "input[name=?]", "quote[nbrFloorsH]"

      assert_select "input[name=?]", "quote[nbrBasementFloorsR]"

      assert_select "input[name=?]", "quote[nbrBasementFloorsC]"

      assert_select "input[name=?]", "quote[nbrBasementFloorsCor]"

      assert_select "input[name=?]", "quote[nbrBasementFloorsH]"

      assert_select "input[name=?]", "quote[nbrDisBuiCor]"

      assert_select "input[name=?]", "quote[nbrDisBuiH]"

      assert_select "input[name=?]", "quote[nbrParkingC]"

      assert_select "input[name=?]", "quote[nbrParkingCor]"

      assert_select "input[name=?]", "quote[nbrParkingH]"

      assert_select "input[name=?]", "quote[nbrElevatorCages]"

      assert_select "input[name=?]", "quote[nbrOccPerFloorCor]"

      assert_select "input[name=?]", "quote[nbrOccPerFloorH]"

      assert_select "input[name=?]", "quote[nbrActPerDay]"

      assert_select "input[name=?]", "quote[serviceType]"
    end
  end
end
