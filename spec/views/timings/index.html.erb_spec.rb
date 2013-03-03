require 'spec_helper'

describe "timings/index" do
  before(:each) do
    assign(:timings, [
      stub_model(Timing,
        :user_id => 1,
        :track_id => 2
      ),
      stub_model(Timing,
        :user_id => 1,
        :track_id => 2
      )
    ])
  end

  it "renders a list of timings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
