Feature: BehaviorDrivenTests
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

@test1
Scenario: Add two numbers
	Given I have entered 50 and 70 into the calculator
	When I press add
	Then the result should be 120 on the screen


@test1
Scenario: Subtract two numbers
	Given I have entered 70 and 50 into the calculator
	When I press subtract
	Then the result should be 20 on the screen

