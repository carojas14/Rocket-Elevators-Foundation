require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        lastName: "Last Name",
        firstName: "First Name",
        title: "Title"
      ),
      Employee.create!(
        lastName: "Last Name",
        firstName: "First Name",
        title: "Title"
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
