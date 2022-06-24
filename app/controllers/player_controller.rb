class PlayerController < ApplicationController

    get "/players" do
        Player.all.to_json
       end

    get "/players/:id" do
        player = Player.find(params[:id])
        player.to_json
    end
    
    post "/create_player" do
        player = Player.create(name: params[:name])
        # player = Player.find_or_create_by(player_params)
        word = Word.all.sample
        game = Game.create(player: player, word: word)
        game.to_json()
    end
    
    patch "players/:id" do
        player = Player.find(params[:id])
        player.update(params[:name])
        player.to_json
    end

    delete "players/:id" do
        player = Player.find(params[:id])
        player.destroy 
        status 204
    end

    private

def player_params
    allowed_params = %w(name game word)
    params.filter {|param,value| allowed_params.include?(param)}
end

end

