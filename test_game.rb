# require_relative 'server'
#
# class Score
#   attr_accessor :message, :player_score, :player_choice, :cpu_score
#
#   def initialize
#     @message = ""
#     @player_score = 0
#     @player_choice = 0
#     @cpu_score = 0
#     @cpu = ["Rock", "Paper", "Scissors"].sample
#   end
#
#   def calculate_score
#     if @player_choice == @cpu
#       @message = "It's a Tie!"
#     elsif @player_choice == "Paper" && @cpu == "Rock" || @player_choice == "Scissors" && @cpu == "Paper" || @player_choice == "Rock" && @cpu == "Scissors"
#       @message = "You beat the computer!! Player Scored!\n\n"
#       @player_score += 1
#     else
#       @message = "The computer beat you! Computer Scored!\n\n"
#       @cpu_score += 1
#     end
#   end
# end
