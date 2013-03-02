require 'spec_helper'

describe "tracks/show" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :name => "Name",
      :city => "City",
      :country => "Country",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/1/)
  end
end
