require 'rails_helper'

RSpec.describe "interventions/new", type: :view do
  before(:each) do
    assign(:intervention, Intervention.new())
  end

  it "renders new intervention form" do
    render

    assert_select "form[action=?][method=?]", interventions_path, "post" do
    end
  end
end
