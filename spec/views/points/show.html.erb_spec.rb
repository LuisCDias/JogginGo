require 'spec_helper'

describe "points/show" do
  before(:each) do
    @point = assign(:point, stub_model(Point,
      :N => "N",
      :W => "W",
      :track_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/N/)
    rendered.should match(/W/)
    rendered.should match(/1/)
  end
end
