require 'rails_helper'

RSpec.describe "elevators/show", type: :view do
  before(:each) do
    @elevator = assign(:elevator, Elevator.create!(
      column: nil,
      serial_nb: 2,
      model: "Model",
      type: "Type",
      certificate_inspection: "Certificate Inspection",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Certificate Inspection/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
