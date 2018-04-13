require Rails.root.join('lib/csv_import/csv_import.rb')

namespace :import do
  desc 'Import data'
  task :csv, [:file_path] => [:environment] do |t, args|
    unless args[:file_path]
      abort "set file_path argument\n" \
            "example:\n" \
            "  rake import:csv[path/to/file.csv]\n" \
            "In zsh remember to escape '[' and ']' chars.\n" \
            "like this:\n" \
            "  rake import:csv\\[path/to/file.csv\\] \n"
    end
    file_path = args[:file_path]
    import = CSVImport.new file_path
    import.start
  end
end
