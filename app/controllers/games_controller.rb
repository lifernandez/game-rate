class GamesController < ApplicationController
  def index
    @games = Game.all
    @search_results = search_game('the witcher 3')
  end


  def show
    @game = Game.find(params[:id])
  end

  private

  def search_game(criteria)
    url = URI("https://opencritic-api.p.rapidapi.com/game/popular")
    query_params = { criteria: criteria }

    headers = {
      'X-RapidAPI-Key' => 'ce5d811d70msh33e02a8f92c9be1p1c233ejsn30c592f0d367',
      'X-RapidAPI-Host' => 'opencritic-api.p.rapidapi.com'
    }

    response = HTTParty.get(url, query: query_params, headers: headers)
    # Process the response and handle the data accordingly
  end
end
