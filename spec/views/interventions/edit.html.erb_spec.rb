require 'rails_helper'

RSpec.describe "interventions/edit", type: :view do
  before(:each) do
    @intervention = assign(:intervention, Intervention.create!())
  end

  it "renders the edit intervention form" do
    render

    assert_select "form[action=?][method=?]", intervention_path(@intervention), "post" do
    end
  end
end
