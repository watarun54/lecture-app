require "csv"

namespace :import_data_from_csv do
  task run: :environment do
    puts ">>> start importing master data"
    [:lecture, :resemblance].each do |klass_name|
      klass = "#{klass_name.to_s.classify}".safe_constantize
      puts "data loading for #{klass}"
      klass.destroy_all
      CSV.open("#{Rails.root}/db/masters/#{klass_name.to_s.pluralize}.csv",
        {headers: true, header_converters: :downcase}).each do |row|
          attrs = row.to_hash
          klass.create! attrs
      end
    end
    puts "<<< finish importing master data"
  end
end
