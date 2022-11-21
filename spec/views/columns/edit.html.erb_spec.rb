require 'rails_helper'

RSpec.describe "columns/edit", type: :view do
  before(:each) do
    @column = assign(:column, Column.create!(
      battery: nil,
      type: "",
      served_floors_nb: 1,
      status: "MyString",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders the edit column form" do
    render

    assert_select "form[action=?][method=?]", column_path(@column), "post" do

      assert_select "input[name=?]", "column[battery_id]"

      assert_select "input[name=?]", "column[type]"

      assert_select "input[name=?]", "column[served_floors_nb]"

      assert_select "input[name=?]", "column[status]"

      assert_select "textarea[name=?]", "column[information]"

      assert_select "textarea[name=?]", "column[notes]"
    end
  end
end
