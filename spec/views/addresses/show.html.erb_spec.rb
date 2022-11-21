require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      type_address: "Type Address",
      status: "Status",
      entity: "Entity",
      number_and_street: "Number And Street",
      suit_or_apartment: "Suit Or Apartment",
      city: "City",
      postal_code: "Postal Code",
      country: "Country",
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type Address/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Entity/)
    expect(rendered).to match(/Number And Street/)
    expect(rendered).to match(/Suit Or Apartment/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/MyText/)
  end
end
