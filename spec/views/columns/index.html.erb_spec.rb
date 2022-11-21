require 'rails_helper'

RSpec.describe "columns/index", type: :view do
  before(:each) do
    assign(:columns, [
      Column.create!(
        battery: nil,
        type: "Type",
        served_floors_nb: 2,
        status: "Status",
        information: "MyText",
        notes: "MyText"
      ),
      Column.create!(
        battery: nil,
        type: "Type",
        served_floors_nb: 2,
        status: "Status",
        information: "MyText",
        notes: "MyText"
      )
    ])
  end

  it "renders a list of columns" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
