require 'tmpdir'

When /^I run 'morning\-pages'$/ do
  run "morning-pages -d #{@dir}"
end

When /^I run 'morning\-pages' for the first time$/ do
  run_interactive "morning-pages -d #{@dir}"
end

Then /^I should be asked for my username and email before writing$/ do
  pending
  all_output.should match(/username/i)
  type('chrismdp')
  all_output.should match(/email/i)
  type('chris@example.com')
end

Then /^I should have my stats uploaded to the website after writing$/ do
  pending # express the regexp above with the code you wish you had
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
end

After do
  FileUtils.remove_entry_secure @dir if File.exists?(@dir)
end
