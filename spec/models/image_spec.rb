# Generated via
#  `rails generate hyrax:work Image`
require 'rails_helper'

RSpec.describe Image do
  describe '#year' do
  	context "with a new Image" do
  		it "has no year value when work is first created" do
  			image = Image.new
  			expect(image.year).to be_empty
  		end
  	end

  	context "with an Image that has year defined" do
  		it "has year assigned to work" do
  			image = Image.new
  			image.year = ["2005"]
  			expect(image.year).to eq(["2005"])
  		end
  	end
  end

  describe '#extent' do
  	context "with new Image work" do
  		it "has no extent value when work is first created" do
  			image = Image.new
  			expect(image.extent).to be_empty
  		end
  	end

  	context "with an Image that has extent" do
  		it "has extent assigned to work" do
  			image = Image.new
  			image.extent = ["1920x1080"]
  			expect(image.extent).to eq(["1920x1080"])
  		end
  	end
  end
end
