require 'rails_helper'

RSpec.describe "columns/new", type: :view do
  before(:each) do
    assign(:column, Column.new(
      battery: nil,
      type: "",
      served_floors_nb: 1,
      status: "MyString",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders new column form" do
    render

    assert_select "form[action=?][method=?]", columns_path, "post" do

      assert_select "input[name=?]", "column[battery_id]"

      assert_select "input[name=?]", "column[type]"

      assert_select "input[name=?]", "column[served_floors_nb]"

      assert_select "input[name=?]", "column[status]"

      assert_select "textarea[name=?]", "column[information]"

      assert_select "textarea[name=?]", "column[notes]"
    end
  end
end
