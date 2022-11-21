require 'rails_helper'

RSpec.describe "batteries/show", type: :view do
  before(:each) do
    @battery = assign(:battery, Battery.create!(
      building: nil,
      employee: nil,
      type: "Type",
      status: "Status",
      certificate_operations: "Certificate Operations",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Certificate Operations/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
