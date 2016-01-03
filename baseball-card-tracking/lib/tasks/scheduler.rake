task :auto_refresh => :environment do
   SearchQuery.delay.auto_refresh
end