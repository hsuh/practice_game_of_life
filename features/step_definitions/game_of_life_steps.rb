require 'game_of_life'

Given /^the following setup$/ do |table|
  @data = table.raw
end

When /^I evolve the board$/ do
  gameOfLife = GameOfLife.new
  @result    = gameOfLife.next_step( @data )
end

Then /^the center cell should be dead$/ do
  #@result.should == @data
  @result[1][1].should == '.'
end

Then /^the center cell should be alive$/ do
  #@result.should_not == @data
  @result[1][1].should == 'x'
end
