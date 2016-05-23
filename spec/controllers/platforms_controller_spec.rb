require 'spec_helper'

describe PlatformsController do

  describe "GET 'platform'" do
    it "returns http success" do
      get 'platform'
      response.should be_success
    end
  end

end
