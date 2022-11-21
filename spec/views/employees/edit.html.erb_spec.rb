require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      lastName: "MyString",
      firstName: "MyString",
      title: "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[lastName]"

      assert_select "input[name=?]", "employee[firstName]"

      assert_select "input[name=?]", "employee[title]"
    end
  end
end
