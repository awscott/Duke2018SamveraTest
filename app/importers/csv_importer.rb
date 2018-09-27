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
			image.depositor = @user.email
			image.source << row[2]
			#we will now use actor stack instead of classes
			#the hyrax way
			#Hyrax::CurationConcern.actor

			image.visibility = Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC
			# Attach the image file and run it through the actor stack
			# Try entering Hyrax::CurationConcern.actor on a console to see all of the
			# actors this object will run through.
			image_binary = File.open("#{::Rails.root}/spec/fixtures/images/#{row[0]}")
			uploaded_file = Hyrax::UploadedFile.create(user: @user, file: image_binary)
			attributes_for_actor = { uploaded_files: [uploaded_file.id] }
			env = Hyrax::Actors::Environment.new(image, ::Ability.new(@user), attributes_for_actor)

			Hyrax::CurationConcern.actor.create(env)
			
			image_binary.close#close the file
		end
	end

end