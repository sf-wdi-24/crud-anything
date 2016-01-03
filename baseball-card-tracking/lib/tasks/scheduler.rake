task :auto_refresh => :environment do
	puts "inside rake"
	SearchQuery.delay.auto_refresh
end