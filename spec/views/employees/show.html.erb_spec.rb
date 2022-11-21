require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      lastName: "Last Name",
      firstName: "First Name",
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Title/)
  end
end
