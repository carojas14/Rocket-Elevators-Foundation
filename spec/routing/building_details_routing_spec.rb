require "rails_helper"

RSpec.describe BuildingDetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/building_details").to route_to("building_details#index")
    end

    it "routes to #new" do
      expect(get: "/building_details/new").to route_to("building_details#new")
    end

    it "routes to #show" do
      expect(get: "/building_details/1").to route_to("building_details#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/building_details/1/edit").to route_to("building_details#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/building_details").to route_to("building_details#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/building_details/1").to route_to("building_details#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/building_details/1").to route_to("building_details#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/building_details/1").to route_to("building_details#destroy", id: "1")
    end
  end
end
