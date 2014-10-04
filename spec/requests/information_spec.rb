require 'rails_helper'

RSpec.describe "Information", :type => :request do
  describe "GET /information" do
    it "works! (now write some real specs)" do
      get information_index_path
      expect(response.status).to be(200)
    end
  end
end
