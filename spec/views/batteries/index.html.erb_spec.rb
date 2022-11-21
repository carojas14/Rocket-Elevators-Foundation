require 'rails_helper'

RSpec.describe "batteries/index", type: :view do
  before(:each) do
    assign(:batteries, [
      Battery.create!(
        building: nil,
        employee: nil,
        type: "Type",
        status: "Status",
        certificate_operations: "Certificate Operations",
        information: "MyText",
        notes: "MyText"
      ),
      Battery.create!(
        building: nil,
        employee: nil,
        type: "Type",
        status: "Status",
        certificate_operations: "Certificate Operations",
        information: "MyText",
        notes: "MyText"
      )
    ])
  end

  it "renders a list of batteries" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Certificate Operations".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
