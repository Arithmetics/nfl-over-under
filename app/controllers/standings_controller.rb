class StandingsController < ApplicationController
  def index
    @bets = Bet.all
    @standings = Standing.all

      #get all the results from the database
      @atlanta_results = Standing.where(team_name: "Dallas Cowboys")
      @boston_results = Standing.where(team_name: "New York Giants")
      @brooklyn_results = Standing.where(team_name: "Philadelphia Eagles")
      @charlotte_results = Standing.where(team_name: "Washington Redskins")
      @chicago_results = Standing.where(team_name: "Chicago Bears")
      @cleveland_results = Standing.where(team_name: "Detroit Lions")
      @dallas_results = Standing.where(team_name: "Green Bay Packers")
      @denver_results = Standing.where(team_name: "Minnesota Vikings")
      @detroit_results = Standing.where(team_name: "Atlanta Falcons")
      @goldenstate_results = Standing.where(team_name: "Carolina Panthers")
      @houston_results = Standing.where(team_name: "New Orleans Saints")
      @indiana_results = Standing.where(team_name: "Tampa Bay Buccaneers")
      @losangelesc_results = Standing.where(team_name: "Los Angeles Rams")
      @losangelesl_results = Standing.where(team_name: "San Francisco 49ers")
      @memphis_results = Standing.where(team_name: "Arizona Cardinals")
      @miami_results = Standing.where(team_name: "Seattle Seahawks")
      @milwaukee_results = Standing.where(team_name: "Buffalo Bills")
      @minnesota_results = Standing.where(team_name: "Miami Dolphins")
      @neworleans_results = Standing.where(team_name: "New England Patriots")
      @newyork_results = Standing.where(team_name: "New York Jets")
      @oklahomacity_results = Standing.where(team_name: "Baltimore Ravens")
      @orlando_results = Standing.where(team_name: "Cincinnati Bengals")
      @philadelpia_results = Standing.where(team_name: "Cleveland Browns")
      @phoenix_results = Standing.where(team_name: "Pittsburgh Steelers")
      @portland_results = Standing.where(team_name: "Houston Texans")
      @sacramento_results = Standing.where(team_name: "Indianapolis Colts")
      @sanantonio_results = Standing.where(team_name: "Jacksonville Jaguars")
      @toronto_results = Standing.where(team_name: "Tennessee Titans")
      @utah_results = Standing.where(team_name: "Denver Broncos")
      @washington_results = Standing.where(team_name: "Kansas City Chiefs")
      @extra_nfl_results = Standing.where(team_name: "Los Angeles Chargers")
      @another_nfl_results = Standing.where(team_name: "Oakland Raiders")

      #get all goal from database
      @atlanta_goals = Standing.where(team_name: "Dallas Cowboys Goal")
      @boston_goals = Standing.where(team_name: "New York Giants Goal")
      @brooklyn_goals = Standing.where(team_name: "Philadelphia Eagles Goal")
      @charlotte_goals = Standing.where(team_name: "Washington Redskins Goal")
      @chicago_goals = Standing.where(team_name: "Chicago Bears Goal")
      @cleveland_goals = Standing.where(team_name: "Detroit Lions Goal")
      @dallas_goals = Standing.where(team_name: "Green Bay Packers Goal")
      @denver_goals = Standing.where(team_name: "Minnesota Vikings Goal")
      @detroit_goals = Standing.where(team_name: "Atlanta Falcons Goal")
      @goldenstate_goals = Standing.where(team_name: "Carolina Panthers Goal")
      @houston_goals = Standing.where(team_name: "New Orleans Saints Goal")
      @indiana_goals = Standing.where(team_name: "Tampa Bay Buccaneers Goal")
      @losangelesc_goals = Standing.where(team_name: "Los Angeles Rams Goal")
      @losangelesl_goals = Standing.where(team_name: "San Francisco 49ers Goal")
      @memphis_goals = Standing.where(team_name: "Arizona Cardinals Goal")
      @miami_goals = Standing.where(team_name: "Seattle Seahawks Goal")
      @milwaukee_goals = Standing.where(team_name: "Buffalo Bills Goal")
      @minnesota_goals = Standing.where(team_name: "Miami Dolphins Goal")
      @neworleans_goals = Standing.where(team_name: "New England Patriots Goal")
      @newyork_goals = Standing.where(team_name: "New York Jets Goal")
      @oklahomacity_goals = Standing.where(team_name: "Baltimore Ravens Goal")
      @orlando_goals = Standing.where(team_name: "Cincinnati Bengals Goal")
      @philadelpia_goals = Standing.where(team_name: "Cleveland Browns Goal")
      @phoenix_goals = Standing.where(team_name: "Pittsburgh Steelers Goal")
      @portland_goals = Standing.where(team_name: "Houston Texans Goal")
      @sacramento_goals = Standing.where(team_name: "Indianapolis Colts Goal")
      @sanantonio_goals = Standing.where(team_name: "Jacksonville Jaguars Goal")
      @toronto_goals = Standing.where(team_name: "Tennessee Titans Goal")
      @utah_goals = Standing.where(team_name: "Denver Broncos Goal")
      @washington_goals = Standing.where(team_name: "Kansas City Chiefs Goal")
      @extra_nfl_goals = Standing.where(team_name: "Los Angeles Chargers Goal")
      @another_nfl_goals = Standing.where(team_name: "Oakland Raiders Goal")

@teams = [
          @atlanta = [@atlanta_results, @atlanta_goals],
          @boston = [@boston_results, @boston_goals],
          @brooklyn = [@brooklyn_results, @brooklyn_goals],
          @harlotte_ = [@charlotte_results, @charlotte_goals],
          @chicago = [@chicago_results, @chicago_goals],
          @cleveland = [@cleveland_results, @cleveland_goals],
          @dallas = [@dallas_results, @dallas_goals],
          @denver = [@denver_results, @denver_goals],
          @detroit = [@detroit_results, @detroit_goals],
          @goldenstate = [@goldenstate_results, @goldenstate_goals],
          @houston = [@houston_results, @houston_goals],
          @indiana = [@indiana_results, @indiana_goals],
          @losangelesc = [@losangelesc_results, @losangelesc_goals],
          @losangelesl = [@losangelesl_results, @losangelesl_goals],
          @memphis = [@memphis_results, @memphis_goals],
          @miami = [@miami_results, @miami_goals],
          @milwaukee = [@milwaukee_results, @milwaukee_goals],
          @minnesota = [@minnesota_results, @minnesota_goals],
          @neworleans = [@neworleans_results, @neworleans_goals],
          @newyork = [@newyork_results, @newyork_goals],
          @oklahomacity = [@oklahomacity_results, @oklahomacity_goals],
          @orlando = [@orlando_results, @orlando_goals],
          @philadelpia = [@philadelpia_results, @philadelpia_goals],
          @phoenix = [@phoenix_results, @phoenix_goals],
          @portland = [@portland_results, @portland_goals],
          @sacramento = [@sacramento_results, @sacramento_goals],
          @sanantonio = [@sanantonio_results, @sanantonio_goals],
          @toronto = [@toronto_results, @toronto_goals],
          @utah = [@utah_results, @utah_goals],
          @washington = [@washington_results, @washington_goals],
          @nfl = [@extra_nfl_results, @extra_nfl_goals],
          @nfl2 = [@another_nfl_results, @extra_nfl_goals]
        ]
  end

  def show
  end
end
