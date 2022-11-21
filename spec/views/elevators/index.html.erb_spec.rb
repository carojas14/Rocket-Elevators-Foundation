require 'rails_helper'

RSpec.describe "elevators/index", type: :view do
  before(:each) do
    assign(:elevators, [
      Elevator.create!(
        column: nil,
        serial_nb: 2,
        model: "Model",
        type: "Type",
        certificate_inspection: "Certificate Inspection",
        information: "MyText",
        notes: "MyText"
      ),
      Elevator.create!(
        column: nil,
        serial_nb: 2,
        model: "Model",
        type: "Type",
        certificate_inspection: "Certificate Inspection",
        information: "MyText",
        notes: "MyText"
      )
    ])
  end

  it "renders a list of elevators" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Model".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Certificate Inspection".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
