Given /^the following setup$/ do |table|
  data = table.raw
  @gameOfLife = GameOfLife.new(data)
end

When /^I evolve the board$/ do
  @gameOfLife.next_generation()
end

Then /^the center cell should be dead$/ do
  result = @gameOfLife.get_next_generation
  result[1][1].should == '.'
end

Then /^the center cell should be alive$/ do
  result = @gameOfLife.get_next_generation()
  result[1][1].should == 'x'
end

Then /^I should see the following board$/ do |table|
  expected_data = table.raw
  result = @gameOfLife.get_next_generation()
  expected_data.should == result
end
