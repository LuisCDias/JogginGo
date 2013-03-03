require "spec_helper"

describe TimingsController do
  describe "routing" do

    it "routes to #index" do
      get("/timings").should route_to("timings#index")
    end

    it "routes to #new" do
      get("/timings/new").should route_to("timings#new")
    end

    it "routes to #show" do
      get("/timings/1").should route_to("timings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/timings/1/edit").should route_to("timings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/timings").should route_to("timings#create")
    end

    it "routes to #update" do
      put("/timings/1").should route_to("timings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/timings/1").should route_to("timings#destroy", :id => "1")
    end

  end
end
