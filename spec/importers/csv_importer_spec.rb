# frozen_string_literal: true

require 'rails_helper'
require 'active_fedora/cleaner'

RSpec.describe CsvImporter do
  let(:three_line_example)     { 'spec/fixtures/three_line_example.csv' }
  let(:one_line_example) 	   {'spec/fixtures/one_line_example.csv'}

  before do
    DatabaseCleaner.clean
    ActiveFedora::Cleaner.clean!
  end

  it "imports a csv" do
    expect { CsvImporter.new(three_line_example).import }.to change { Image.count }.by 3
  end
  it "creates an image with the proper title" do
  	original_title = "A Cute Dog"
  	CsvImporter.new(one_line_example).import
  	image = Image.last
  	expect(image.title).to eq([original_title])
  end
  it "adds the attachment to the Image" do
  	skip 'yolo'
  end
end