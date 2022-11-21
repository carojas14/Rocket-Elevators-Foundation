require 'rails_helper'

RSpec.describe "building_details/new", type: :view do
  before(:each) do
    assign(:building_detail, BuildingDetail.new(
      building: nil,
      information_key: "MyString",
      value: "MyString"
    ))
  end

  it "renders new building_detail form" do
    render

    assert_select "form[action=?][method=?]", building_details_path, "post" do

      assert_select "input[name=?]", "building_detail[building_id]"

      assert_select "input[name=?]", "building_detail[information_key]"

      assert_select "input[name=?]", "building_detail[value]"
    end
  end
end
