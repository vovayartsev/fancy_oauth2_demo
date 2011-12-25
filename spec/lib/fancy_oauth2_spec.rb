require "spec_helper"


describe FancyOauth2 do

  before :each do
    FancyOauth2.configure do |config|
      config.default_options = {
        scope: 'https://www.google.com/analytics/feeds/',
        redirect_uri: "http://localhost:3000/callback"
      }
    end
  end

  it "should implement 'config' method with attributes" do
    for name in %w(client_id client_secret site authorize_url token_url default_options)
      FancyOauth2.config.should respond_to(name)
      FancyOauth2.config.should respond_to("#{name}=")
    end
  end

  it "should build default options" do
    FancyOauth2.configure do |config|
      config.default_options = { :static => "hello", :dynamic => lambda{|x| x*x} }
    end
    options = FancyOauth2.config.build_default_options(3)
    options[:static].should == "hello"
    options[:dynamic].should == 9
  end

  it "should implement 'client'" do
    FancyOauth2.client.should_not be_nil
  end

  it "should implement authorize_url" do
    FancyOauth2.authorize_url.should =~ /google/
    FancyOauth2.authorize_url(redirect_uri: "http://example.com/").should =~ /analytics/ 
    FancyOauth2.authorize_url(redirect_uri: "http://example.com/").should =~ /example.com/
    FancyOauth2.authorize_url(scope: "docs").should_not =~ /analytics/ 
  end



end

