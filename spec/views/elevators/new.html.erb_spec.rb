require 'rails_helper'

RSpec.describe "elevators/new", type: :view do
  before(:each) do
    assign(:elevator, Elevator.new(
      column: nil,
      serial_nb: 1,
      model: "MyString",
      type: "",
      certificate_inspection: "MyString",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders new elevator form" do
    render

    assert_select "form[action=?][method=?]", elevators_path, "post" do

      assert_select "input[name=?]", "elevator[column_id]"

      assert_select "input[name=?]", "elevator[serial_nb]"

      assert_select "input[name=?]", "elevator[model]"

      assert_select "input[name=?]", "elevator[type]"

      assert_select "input[name=?]", "elevator[certificate_inspection]"

      assert_select "textarea[name=?]", "elevator[information]"

      assert_select "textarea[name=?]", "elevator[notes]"
    end
  end
end
