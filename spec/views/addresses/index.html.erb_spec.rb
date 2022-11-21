require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        type_address: "Type Address",
        status: "Status",
        entity: "Entity",
        number_and_street: "Number And Street",
        suit_or_apartment: "Suit Or Apartment",
        city: "City",
        postal_code: "Postal Code",
        country: "Country",
        notes: "MyText"
      ),
      Address.create!(
        type_address: "Type Address",
        status: "Status",
        entity: "Entity",
        number_and_street: "Number And Street",
        suit_or_apartment: "Suit Or Apartment",
        city: "City",
        postal_code: "Postal Code",
        country: "Country",
        notes: "MyText"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", text: "Type Address".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Entity".to_s, count: 2
    assert_select "tr>td", text: "Number And Street".to_s, count: 2
    assert_select "tr>td", text: "Suit Or Apartment".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Postal Code".to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
