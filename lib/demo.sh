#!/usr/bin/env ruby
#You can run this file by typing ./demo.sh in terminal (you might have to make this file +x)
#Feel free to change the parameters

load 'playLife.rb'

#glidergun is in the same folder. You can create your own *.world files!
PlayLife.load_world('glidergun.world')

#Playlife.runLife(pause_time, Number of generations)
PlayLife.runLife(0.1,500)
