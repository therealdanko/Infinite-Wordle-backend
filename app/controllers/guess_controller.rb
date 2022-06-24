class GuessController < ApplicationController
    get "/guesses" do
        Guess.all.to_json
       end

    get "/guesses/:id" do
        guess = Guess.find(params[:id])
        guess.to_json
    end
    
    post "/guess_attempt" do

        guess = Guess.attempt(guess_params)
        guess.to_json
    end

       private

def guess_params
    allowed_params = %w(input word game)
    params.filter {|param,value| allowed_params.include?(param)}
end

end