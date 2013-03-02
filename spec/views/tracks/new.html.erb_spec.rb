require 'spec_helper'

describe "tracks/new" do
  before(:each) do
    assign(:track, stub_model(Track,
      :name => "MyString",
      :city => "MyString",
      :country => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tracks_path, :method => "post" do
      assert_select "input#track_name", :name => "track[name]"
      assert_select "input#track_city", :name => "track[city]"
      assert_select "input#track_country", :name => "track[country]"
      assert_select "input#track_user_id", :name => "track[user_id]"
    end
  end
end
