require 'csv'
class CsvImporter

	def initialize(file)
		@file = file
		@user = ::User.batch_user #this is a user that comes with hyrax

	end

	def import
		CSV.foreach(@file) do |row|
			image = Image.new()
			image.title << row[1]
			image.save
		end
	end

end