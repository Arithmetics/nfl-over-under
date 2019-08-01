desc "Fetch current standings"
task :fetch_standings => :environment do

  require 'nokogiri'
  require 'open-uri'

  team_benchmarks = {
  "Dallas Cowboys" => 8.5/16,
  "New York Giants" => 5.5/16,
  "Philadelphia Eagles" => 10.5/16,
  "Washington Redskins" => 5.5/16,
  "Chicago Bears" => 9.5/16,
  "Detroit Lions" => 6.5/16,
  "Green Bay Packers" => 9.5/16,
  "Minnesota Vikings" => 8.5/16,
  "Atlanta Falcons" => 8.5/16,
  "Carolina Panthers" => 7.5/16,
  "New Orleans Saints" => 10.5/16,
  "Tampa Bay Buccaneers" => 6.5/16,
  "Los Angeles Rams" => 10.5/16,
  "San Francisco 49ers" => 8.5/16,
  "Arizona Cardinals" => 5.5/16,
  "Seattle Seahawks" => 8.5/16,
  "Buffalo Bills" => 7.5/16,
  "Miami Dolphins" => 4.5/16,
  "New England Patriots" => 11.5/16,
  "New York Jets" => 7.5/16,
  "Baltimore Ravens" => 8.5/16,
  "Cincinnati Bengals" => 5.5/16,
  "Cleveland Browns" => 9.5/16,
  "Pittsburgh Steelers" => 9.5/16,
  "Houston Texans" => 8.5/16,
  "Indianapolis Colts" => 9.5/16,
  "Jacksonville Jaguars" => 7.5/16,
  "Tennessee Titans" => 7.5/16,
  "Denver Broncos" => 7.5/16,
  "Kansas City Chiefs" => 10.5/16,
  "Los Angeles Chargers" => 9.5/16,
  "Oakland Raiders" => 5.5/16
                     }

  page = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

  team_names = page.css("abbr").map do |team_name|
                team_name.attribute('title').value
  end
  
  losses = []
  wins = []
  ties = []
  
  rows = page.css(".Table2__tbody")[1].css("tr")
  
  rows.each_with_index do |row, index|
    if index != 0 && row.css("td")[0].text != "W"
      columns = row.css("td")
      wins.push(columns[0].text.to_i)
      losses.push(columns[1].text.to_i)
      ties.push(columns[2].text.to_i)
    end
  end

  ids = (0..31).to_a

  ids.each do |id|
    if Standing.where(team_name: team_names[id], games_played: (wins[id]+losses[id]+ties[id])).empty?
      #create standing value
      total_games = wins[id]+losses[id]+ties[id]
      win_loss_pct = 0
      if total_games != 0
        win_loss_pct = (wins[id].to_f / total_games.to_f).round(3)
      end

       Standing.create!(
         team_name: team_names[id], games_played: (wins[id]+losses[id]+ties[id]),
         wins: wins[id], losses: losses[id], win_loss_pct: win_loss_pct)
         #create cooresponding graph goal point
         Standing.create!(
           team_name: "#{team_names[id]} Goal", games_played: (wins[id]+losses[id]+ties[id]),
           wins: wins[id], losses: losses[id], win_loss_pct: team_benchmarks[team_names[id]])
    end
  end



end
