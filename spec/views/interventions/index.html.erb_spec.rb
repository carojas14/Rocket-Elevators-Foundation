require 'rails_helper'

RSpec.describe "interventions/index", type: :view do
  before(:each) do
    assign(:interventions, [
      Intervention.create!(),
      Intervention.create!()
    ])
  end

  it "renders a list of interventions" do
    render
  end
end
