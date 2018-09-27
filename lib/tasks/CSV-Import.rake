require 'csv'

namespace :duke_camp do
  desc "CSV Import of Image"

  task csv_import: [:environment] do
    puts "importing CSV"

    csv_file = "./imageWork.csv"
    CsvImporter.new(csv_file).import
  end
end
