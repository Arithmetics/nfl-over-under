class StandingsController < ApplicationController
  def index
    @bets = Bet.all
    @standings = Standing.all

      #get all the results from the database
      @atlanta_results = Standing.where(team_name: "Atlanta Hawks")
      @boston_results = Standing.where(team_name: "Boston Celtics")
      @brooklyn_results = Standing.where(team_name: "Brooklyn Nets")
      @charlotte_results = Standing.where(team_name: "Charlotte Hornets")
      @chicago_results = Standing.where(team_name: "Chicago Bulls")
      @cleveland_results = Standing.where(team_name: "Cleveland Cavaliers")
      @dallas_results = Standing.where(team_name: "Dallas Mavericks")
      @denver_results = Standing.where(team_name: "Denver Nuggets")
      @detroit_results = Standing.where(team_name: "Detroit Pistons")
      @goldenstate_results = Standing.where(team_name: "Golden State Warriors")
      @houston_results = Standing.where(team_name: "Houston Rockets")
      @indiana_results = Standing.where(team_name: "Indiana Pacers")
      @losangelesc_results = Standing.where(team_name: "Los Angeles Clippers")
      @losangelesl_results = Standing.where(team_name: "Los Angeles Lakers")
      @memphis_results = Standing.where(team_name: "Memphis Grizzlies")
      @miami_results = Standing.where(team_name: "Miami Heat")
      @milwaukee_results = Standing.where(team_name: "Milwaukee Bucks")
      @minnesota_results = Standing.where(team_name: "Minnesota Timberwolves")
      @neworleans_results = Standing.where(team_name: "New Orleans Pelicans")
      @newyork_results = Standing.where(team_name: "New York Knicks")
      @oklahomacity_results = Standing.where(team_name: "Oklahoma City Thunder")
      @orlando_results = Standing.where(team_name: "Orlando Magic")
      @philadelpia_results = Standing.where(team_name: "Philadelphia 76ers")
      @phoenix_results = Standing.where(team_name: "Phoenix Suns")
      @portland_results = Standing.where(team_name: "Portland Trail Blazers")
      @sacramento_results = Standing.where(team_name: "Sacramento Kings")
      @sanantonio_results = Standing.where(team_name: "San Antonio Spurs")
      @toronto_results = Standing.where(team_name: "Toronto Raptors")
      @utah_results = Standing.where(team_name: "Utah Jazz")
      @washington_results = Standing.where(team_name: "Washington Wizards")

      #get all goal from database
      @atlanta_goals = Standing.where(team_name: "Atlanta Hawks Goal")
      @boston_goals = Standing.where(team_name: "Boston Celtics Goal")
      @brooklyn_goals = Standing.where(team_name: "Brooklyn Nets Goal")
      @charlotte_goals = Standing.where(team_name: "Charlotte Hornets Goal")
      @chicago_goals = Standing.where(team_name: "Chicago Bulls Goal")
      @cleveland_goals = Standing.where(team_name: "Cleveland Cavaliers Goal")
      @dallas_goals = Standing.where(team_name: "Dallas Mavericks Goal")
      @denver_goals = Standing.where(team_name: "Denver Nuggets Goal")
      @detroit_goals = Standing.where(team_name: "Detroit Pistons Goal")
      @goldenstate_goals = Standing.where(team_name: "Golden State Warriors Goal")
      @houston_goals = Standing.where(team_name: "Houston Rockets Goal")
      @indiana_goals = Standing.where(team_name: "Indiana Pacers Goal")
      @losangelesc_goals = Standing.where(team_name: "Los Angeles Clippers Goal")
      @losangelesl_goals = Standing.where(team_name: "Los Angeles Lakers Goal")
      @memphis_goals = Standing.where(team_name: "Memphis Grizzlies Goal")
      @miami_goals = Standing.where(team_name: "Miami Heat Goal")
      @milwaukee_goals = Standing.where(team_name: "Milwaukee Bucks Goal")
      @minnesota_goals = Standing.where(team_name: "Minnesota Timberwolves Goal")
      @neworleans_goals = Standing.where(team_name: "New Orleans Pelicans Goal")
      @newyork_goals = Standing.where(team_name: "New York Knicks Goal")
      @oklahomacity_goals = Standing.where(team_name: "Oklahoma City Thunder Goal")
      @orlando_goals = Standing.where(team_name: "Orlando Magic Goal")
      @philadelpia_goals = Standing.where(team_name: "Philadelphia 76ers Goal")
      @phoenix_goals = Standing.where(team_name: "Phoenix Suns Goal")
      @portland_goals = Standing.where(team_name: "Portland Trail Blazers Goal")
      @sacramento_goals = Standing.where(team_name: "Sacramento Kings Goal")
      @sanantonio_goals = Standing.where(team_name: "San Antonio Spurs Goal")
      @toronto_goals = Standing.where(team_name: "Toronto Raptors Goal")
      @utah_goals = Standing.where(team_name: "Utah Jazz Goal")
      @washington_goals = Standing.where(team_name: "Washington Wizards Goal")

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
          @washington = [@washington_results, @washington_goals]
        ]
  end

  def show
  end
end
