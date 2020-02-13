namespace :book do
    desc "Synchronizes books without data with external book data source"
    task :sync_all => :environment do
        Book.where(description: nil).find_each do |book|
            Books::SynchronizeBook.new(book).call
        end 
    end
end