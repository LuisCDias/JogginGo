require 'spec_helper'

describe "points/new" do
  before(:each) do
    assign(:point, stub_model(Point,
      :N => "MyString",
      :W => "MyString",
      :track_id => 1
    ).as_new_record)
  end

  it "renders new point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => points_path, :method => "post" do
      assert_select "input#point_N", :name => "point[N]"
      assert_select "input#point_W", :name => "point[W]"
      assert_select "input#point_track_id", :name => "point[track_id]"
    end
  end
end
