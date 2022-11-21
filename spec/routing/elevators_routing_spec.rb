require "rails_helper"

RSpec.describe ElevatorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/elevators").to route_to("elevators#index")
    end

    it "routes to #new" do
      expect(get: "/elevators/new").to route_to("elevators#new")
    end

    it "routes to #show" do
      expect(get: "/elevators/1").to route_to("elevators#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/elevators/1/edit").to route_to("elevators#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/elevators").to route_to("elevators#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/elevators/1").to route_to("elevators#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/elevators/1").to route_to("elevators#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/elevators/1").to route_to("elevators#destroy", id: "1")
    end
  end
end
