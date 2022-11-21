require 'rails_helper'

RSpec.describe "building_details/edit", type: :view do
  before(:each) do
    @building_detail = assign(:building_detail, BuildingDetail.create!(
      building: nil,
      information_key: "MyString",
      value: "MyString"
    ))
  end

  it "renders the edit building_detail form" do
    render

    assert_select "form[action=?][method=?]", building_detail_path(@building_detail), "post" do

      assert_select "input[name=?]", "building_detail[building_id]"

      assert_select "input[name=?]", "building_detail[information_key]"

      assert_select "input[name=?]", "building_detail[value]"
    end
  end
end
