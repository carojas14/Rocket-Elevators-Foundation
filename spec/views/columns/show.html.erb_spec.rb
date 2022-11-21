require 'rails_helper'

RSpec.describe "columns/show", type: :view do
  before(:each) do
    @column = assign(:column, Column.create!(
      battery: nil,
      type: "Type",
      served_floors_nb: 2,
      status: "Status",
      information: "MyText",
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
