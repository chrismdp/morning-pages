require 'tmpdir'
require 'background_process'

def prep_config
  yaml = "---\n:username: test\n:email: test@example.com\n"
  File.open(@config, 'w') { |f| f.write(yaml) }
end

def command
  "morning-pages -d #{@dir} -c #{@config} -s http://localhost:45110/api"
end

When /^I run 'morning\-pages'$/ do
  prep_config
  run command
end

When /^I run 'morning\-pages' for the first time$/ do
  run_interactive command
  type("chrismdp")
  type("chris@example.com")
end

Then /^I should be asked for my username and email before writing$/ do
  all_output.should match(/username/i)
  all_output.should match(/email/i)
end

Then /^I should have my stats uploaded to the website after writing$/ do
  all_output.should match(/uploaded/i)
end

Then /^I should be able to write my words$/ do
  now = Time.now
  check_exact_file_content "#{@dir}/#{Time.now.strftime("%Y\-%m\-%d")}", "fake editor output"
end

Then /^I should see my current word stats after I finish$/ do
  all_output.should match(/3 words/)
end

Before do
  @dir = Dir.mktmpdir + "/words/foo"
  @config = Dir.mktmpdir + '/config.yml'
  @server = BackgroundProcess.run("bundle exec rackup -p 45110 features/support/server.ru")
  @out = []
  @server.detect { |line| @out << line; line =~ /WEBrick::HTTPServer#start/ }
end


After do
  FileUtils.remove_entry_secure @dir if File.exists?(@dir)
  @server.kill("KILL")
  @server.wait
  @out << @server.stdout.read
  @out << @server.stderr.read
  puts "Stopped server"
  puts "TEST SERVER OUTPUT"
  puts @out.join
  $stdout.flush
end
