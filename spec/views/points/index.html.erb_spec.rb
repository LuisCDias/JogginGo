require 'spec_helper'

describe "points/index" do
  before(:each) do
    assign(:points, [
      stub_model(Point,
        :N => "N",
        :W => "W",
        :track_id => 1
      ),
      stub_model(Point,
        :N => "N",
        :W => "W",
        :track_id => 1
      )
    ])
  end

  it "renders a list of points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "N".to_s, :count => 2
    assert_select "tr>td", :text => "W".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
