require "sinatra"
require 'pry'
require_relative 'test_game'

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe",
}

before do
  session[:value] = params[:choice]
  @cpu = ["Rock", "Paper", "Scissors"].sample
end

get "/game" do
  if session[:visit_count].nil?
    session[:visit_count] = 1
    session[:player_score] = 0
    session[:cpu_score] = 0
  else
    session[:visit_count] += 1
  end
  erb :game
end

get "/result" do
  if session[:player_score] >= 2
    @message = "You won the game! Play again?"
  else
    @message = "You lost the game! Play again?"
  end
  erb :result
end

post "/result" do
  session[:visit_count] = nil
  redirect "/game"
end

post "/game" do
  unless session[:player_score] >= 2 || session[:cpu_score] >= 2
    if session[:value] == @cpu
      @winner = "It's a tie!"
    elsif session[:value] == "Paper" && @cpu == "Rock" || session[:value] == "Scissors" && @cpu == "Paper" || session[:value] == "Rock" && @cpu == "Scissors"
      session[:player_score] += 1
      @winner = "Player is the winner!"
    else
      session[:cpu_score] += 1
      @winner = "Computer is the winner!"
    end
    redirect "/game"
  else
    redirect "/result"
  end
end
