# File:           warmup.rb
# Purpose:        Week 2 solo project - Various small game exercises for the Viking Code School's Ruby curriculum.
# Author:         Paul H. Hyman (phyman.com | GitHub: phyman)
# Copyright:      (C) Paul H. Hyman 2014 -
# Product:        Warmup Ruby exercises described here: http://www.vikingcodeschool.com/week-2-ruby/assignment-ramping-up-with-oop

#!/usr/bin/ruby

################################
# DEBUG CONTROLS

NONE	= 0
DEBUG = 1
MSG_LEVEL = DEBUG 
Production = false

################################
# Dice Class
#
# Pass in the number of sides the dice is have.
#
# Call roll() to roll the dice (return a random number)
#

class Dice

	# lowest num of sides to have a random result is 2
	@num_sides = 2 

protected
  
	def initialize(num_sides = 2)
		if MSG_LEVEL >= DEBUG
			puts "Dice.INIT - num_sides = #{num_sides}"  	
		end
		@num_sides = num_sides
	end

public

	# allow the number of sides of the dice to be known to the public
	attr_reader :num_sides 

	def roll()
		if MSG_LEVEL >= DEBUG
			puts "Dice::roll -> rolling a #{@num_sides} sided dice" 
		end
		return rand(1..@num_sides) 
	end # roll

end #Dice

################################
# roll_dice method
# 
# num_dice: 	the number of dice to roll (default is 1)
# num_sides: 	the number of sides the dice should have (default is 6)
# 
# returns:  	the accumulated total of all the dice rolled
# 

def roll_dice(num_dice = 1, num_sides = 6)

	accumulator = 0
	dice_type = Dice.new(num_sides)

	num_dice.times do 
		if Production
			accumulator += dice_type.roll
		else
			roll_result = dice_type.roll 
			accumulator += roll_result	
			if MSG_LEVEL >= DEBUG
				puts "roll_dice:: Rolled a #{roll_result} & current total is: #{accumulator}"
			end
		end
	end # times loop

	if !Production 
		puts "#{num_dice} #{dice_type.num_sides.to_s} sided dice were rolled and totaled #{accumulator}"
	else
		puts "#{accumulator}"
	end

end #roll_dice


roll_dice(rand(1..6)) # call from script
# roll_dice(10) # call from script

