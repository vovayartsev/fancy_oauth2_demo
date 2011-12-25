require 'spec_helper'

describe FancyOauth2Helper do
  before :each do
    @values = {access_token: "abcde", refresh_token: "12345", expires_in: 3600}
  end

  it "should display fancy_oauth2 within a div" do
    result = helper.fancy_oauth2_tag :auth, @values.to_json
    result.should =~ /div/
    result.should =~ /success/
    result.should =~ /Click to/
  end

  it "should not display success class if empty data" do
    result = helper.fancy_oauth2_tag :auth
    result.should =~ /div/
    result.should_not =~ /success/
  end

  it "should not display success class if nil data" do
    result = helper.fancy_oauth2_tag :auth, nil
    result.should =~ /div/
    result.should_not =~ /success/
  end
end
