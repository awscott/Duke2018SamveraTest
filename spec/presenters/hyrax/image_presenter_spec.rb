# Generated via
#  `rails generate hyrax:work Image`
require 'rails_helper'

RSpec.describe Hyrax::ImagePresenter do
  subject { presenter }

  let(:title) { ['Example title'] }
  let(:creator) { ['Doe, Jane'] }
  let(:keyword) { ['hello world'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:user) { 'test@example.com' }
  let(:year) { ['1920'] }

  let :image do
	Image.create(
		title: title,
		creator: creator,
		keyword: keyword,
		visibility: visibility,
		depositor: user,
		year: year
	)
  end

  let(:ability) { Ability.new(user) }

  let(:solr_document) { SolrDocument.new(image.to_solr) }

  let(:presenter) do
  	described_class.new(solr_document, nil)
  end

  it "delegates year to Solr Document" do
  	expect(solr_document).to receive(:year)
  	presenter.year
  end
end
