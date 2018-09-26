require 'rails_helper'

RSpec.feature 'Display an Image work' do
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

	scenario 'Show an Image work' do
		visit("concern/images/#{image.id}")

		expect(page).to have_content image.title.first
		expect(page).to have_content image.creator.first
		expect(page).to have_content image.keyword.first
		expect(page).to have_content image.year.first
	end
end