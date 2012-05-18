#!/usr/bin/env ruby

################################################################################
#You can run this file by typing ./demo.sh in terminal (you might have to make
#this file chmod +x)
#Feel free to change the parameters.
#
#Input file             - glidergun.world (Or create your own!)
#Delay/Pause            - 0.5 seconds
#Number of generations  - 500
################################################################################

load 'playLife.rb'
PlayLife.load_world('glidergun.world')

#Parameters (delay in seconds, Number of generations)
PlayLife.runLife(0.1,500)
