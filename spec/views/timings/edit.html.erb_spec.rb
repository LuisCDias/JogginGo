require 'spec_helper'

describe "timings/edit" do
  before(:each) do
    @timing = assign(:timing, stub_model(Timing,
      :user_id => 1,
      :track_id => 1
    ))
  end

  it "renders the edit timing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => timings_path(@timing), :method => "post" do
      assert_select "input#timing_user_id", :name => "timing[user_id]"
      assert_select "input#timing_track_id", :name => "timing[track_id]"
    end
  end
end
