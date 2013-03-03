require 'spec_helper'

describe "timings/show" do
  before(:each) do
    @timing = assign(:timing, stub_model(Timing,
      :user_id => 1,
      :track_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
