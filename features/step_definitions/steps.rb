require 'tmpdir'

When /^I run 'morning\-pages'$/ do
  run "morning-pages -d #{@dir}"
end

Then /^I should be able to write my words$/ do
  now = Time.now
  check_exact_file_content "#{@dir}/#{Time.now.strftime("%Y\-%m\-%d")}", "fake editor output"
end

Then /^I see my current word count after I finish$/ do
  all_output.should match(/3 words/)
end

Before do
  @dir = Dir.mktmpdir + "/words/foo"
end

After do
  FileUtils.remove_entry_secure @dir
end
