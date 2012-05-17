Given /^the following setup$/ do |table|
  @data = table.raw
end

When /^I evolve the board$/ do
  gameOfLife = GameOfLife.new
  @result    = gameOfLife.next_generation( @data )
end

Then /^the center cell should be dead$/ do
  @result[1][1].should == '.'
end

Then /^the center cell should be alive$/ do
  @result[1][1].should == 'x'
end

Then /^I should see the following board$/ do |table|
  expected_data = table.raw
  (expected_data - @result).should == []
end
