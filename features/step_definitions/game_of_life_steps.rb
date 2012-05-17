require 'game_of_life'

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
