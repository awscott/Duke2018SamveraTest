# Generated via
#  `rails generate hyrax:work Image`
require 'rails_helper'

RSpec.describe Hyrax::ImageForm do
  subject { form }
  let(:image) { Image.new }
  let(:ability) { Ability.new(nil) } # maps user to view. eg: registered user can submit etd
  let(:request) { nil } # http request
  let(:form) { described_class.new(image, ability, request) }

  it "has form terms" do
  	expect(form.terms).to include(:title)
  	expect(form.terms).to include(:year)
  	expect(form.terms).to include(:extent)
  end
end
