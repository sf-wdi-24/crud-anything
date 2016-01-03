task :auto_refresh => :environment do
   Search.delay.auto_refresh
end