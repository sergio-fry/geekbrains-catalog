namespace :cron do
  task :test_file do
    `touch /Users/sergei/code/geekbrains/catalog/tmp/test_file_whenever.txt`
    puts "file created!"
  end
end
