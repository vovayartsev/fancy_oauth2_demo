require 'spec_helper'

describe "Welcomes" do
  describe "GET /welcomes" do
    it "should render /" do
      visit "/"
      page.should have_content("(re)authenticate")
    end
  end
end
