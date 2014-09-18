# File:           warmup.rb
# Purpose:        Week 2 solo project - Various small game exercises for the Viking Code School's Ruby curriculum.
# Author:         Paul H. Hyman (phyman.com | GitHub: phyman)
# Copyright:      (C) Paul H. Hyman 2014 -
# Product:        Warmup Ruby exercises described here: http://www.vikingcodeschool.com/week-2-ruby/assignment-ramping-up-with-oop

#!/usr/bin/ruby

NONE	= 0
DEBUG = 1
INFO 	= 2
WARN 	= 3
ERROR = 4
MSG_LEVEL = NONE 
Production = false
################################
# Dice

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

	# allow the number of sides of the dice to be known
	attr_reader :num_sides 

	def roll()
		if MSG_LEVEL >= INFO
			puts "rolling a #{@num_sides} sided dice" 
		end
		return rand(1..@num_sides) 
	end # roll

end #Dice

################################
# SixSidedDice

class SixSidedDice < Dice

private
	Num_sides = 6 # a CONST var

protected
	def initialize()
		if MSG_LEVEL >= DEBUG
			puts "SixSidedDice.INIT"	
		end
		super(Num_sides)
	end

# >> this works <<
# private
# 	@num_sides = 6
#
# protected 
# 	def initialize(num_sides = 6)
# 		if MSG_LEVEL <= DEBUG
# 			puts "SixSidedDice.INIT"	
# 		end
# 		super(num_sides)
# 	end

end # SixSidedDice


################################
# roll_dice

def roll_dice(num_dice = 1, dice_type = SixSidedDice)

	accumulator = 0
	dice_type = dice_type.new # defaults to SixSidedDice

	num_dice.times do 
		if Production
			accumulator += dice_type.roll
		else
			roll_result = dice_type.roll 
			accumulator += roll_result	
		end
	end # times loop

	if !Production 
		puts "#{num_dice} #{dice_type.num_sides.to_s} sided dice were rolled and totaled #{accumulator}"
	else
		puts "#{accumulator}"
	end


end #roll_dice


# roll_dice(rand(1..6)) # call from script
roll_dice(10) # call from script

=begin
################################
# roll_dice

def roll_dice(num_dice = 1)
	accumulator = 0
	num_sides = 6
	
	num_dice.times do
		# debugging
		roll_result = rand(1..num_sides)
		accumulator += roll_result
		# prod
		#accumulator += rand(1..num_sides)
		puts "Rolled a #{roll_result}. Total is now #{accumulator}"
	end # times loop

	puts accumulator
end #roll_dice

roll_dice(rand(1..6))
=end