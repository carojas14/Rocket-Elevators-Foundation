require "rails_helper"

RSpec.describe BatteriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/batteries").to route_to("batteries#index")
    end

    it "routes to #new" do
      expect(get: "/batteries/new").to route_to("batteries#new")
    end

    it "routes to #show" do
      expect(get: "/batteries/1").to route_to("batteries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/batteries/1/edit").to route_to("batteries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/batteries").to route_to("batteries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/batteries/1").to route_to("batteries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/batteries/1").to route_to("batteries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/batteries/1").to route_to("batteries#destroy", id: "1")
    end
  end
end
