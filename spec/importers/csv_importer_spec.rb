# frozen_string_literal: true


require 'rails_helper'
require 'active_fedora/cleaner'

RSpec.describe CsvImporter do
  let(:three_line_example)     { 'spec/fixtures/three_line_example.csv' }
  let(:one_line_example) 	   {'spec/fixtures/one_line_example.csv'}

  before do
    allow(CharacterizeJob).to receive(:perform_later) # turns this into a mock, which does nothing
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
  it "creates a Image work with a file_set associated with it" do
    CsvImporter.new(one_line_example).import
    expect(Image.last.file_sets.count).to eq(1)
  end
end