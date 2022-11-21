require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      type_address: "MyString",
      status: "MyString",
      entity: "MyString",
      number_and_street: "MyString",
      suit_or_apartment: "MyString",
      city: "MyString",
      postal_code: "MyString",
      country: "MyString",
      notes: "MyText"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[type_address]"

      assert_select "input[name=?]", "address[status]"

      assert_select "input[name=?]", "address[entity]"

      assert_select "input[name=?]", "address[number_and_street]"

      assert_select "input[name=?]", "address[suit_or_apartment]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[postal_code]"

      assert_select "input[name=?]", "address[country]"

      assert_select "textarea[name=?]", "address[notes]"
    end
  end
end
