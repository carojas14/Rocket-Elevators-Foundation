require 'rails_helper'

RSpec.describe "batteries/new", type: :view do
  before(:each) do
    assign(:battery, Battery.new(
      building: nil,
      employee: nil,
      type: "",
      status: "MyString",
      certificate_operations: "MyString",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders new battery form" do
    render

    assert_select "form[action=?][method=?]", batteries_path, "post" do

      assert_select "input[name=?]", "battery[building_id]"

      assert_select "input[name=?]", "battery[employee_id]"

      assert_select "input[name=?]", "battery[type]"

      assert_select "input[name=?]", "battery[status]"

      assert_select "input[name=?]", "battery[certificate_operations]"

      assert_select "textarea[name=?]", "battery[information]"

      assert_select "textarea[name=?]", "battery[notes]"
    end
  end
end
