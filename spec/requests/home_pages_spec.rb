require 'spec_helper'

describe "HomePages" do
  
  subject {page}

  describe "navigation bar links" do
  	
  	before do
      visit root_path
  		click_link "JogginGo!"  
  	end

  	it "should have title with 'JogginGo'" do
  		should have_selector('title', text: "JogginGo!")
  	end
  end
end
