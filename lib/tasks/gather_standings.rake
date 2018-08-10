desc "Fetch current standings"
task :fetch_standings => :environment do

  require 'nokogiri'
  require 'open-uri'

  team_benchmarks = {
  "Dallas Cowboys" => 8.5/16,
  "New York Giants" => 7/16,
  "Philadelphia Eagles" => 10.5/16,
  "Washington Redskins" => 7/16,
  "Chicago Bears" => 6.5/16,
  "Detroit Lions" => 7.5/16,
  "Green Bay Packers" => 10/16,
  "Minnesota Vikings" => 10/16,
  "Atlanta Falcons" => 9/16,
  "Carolina Panthers" => 9/16,
  "New Orleans Saints" => 9.5/16,
  "Tampa Bay Buccaneers" => 6.5/16,
  "Los Angeles Rams" => 10/16,
  "San Francisco 49ers" => 8.5/16,
  "Arizona Cardinals" => 5.5/16,
  "Seattle Seahawks" => 8/16,
  "Buffalo Bills" => 6/16,
  "Miami Dolphins" => 6.5/16,
  "New England Patriots" => 11/16,
  "New York Jets" => 6/16,
  "Baltimore Ravens" => 8/16,
  "Cincinnati Bengals" => 6.5/16,
  "Cleveland Browns" => 5.5/16,
  "Pittsburgh Steelers" => 10.5/16,
  "Houston Texans" => 8.5/16,
  "Indianapolis Colts" => 6.5/16,
  "Jacksonville Jaguars" => 9/16,
  "Tennessee Titans" => 8/16,
  "Denver Broncos" => 7/16,
  "Kansas City Chiefs" => 8.5/16,
  "Los Angeles Chargers" => 9.5/16,
  "Oakland Raiders" => 8/16
                     }

  page = Nokogiri::HTML(open("http://www.espn.com/nfl/standings"))

  team_names = page.css("abbr").map do |team_name|
                team_name.attribute('title').value
              end

  wins = page.css("td[data-stat='wins']").map do |win|
           win.text.to_i
         end

  losses = page.css("td[data-stat='losses']").map do |loss|
          loss.text.to_i
        end

  win_loss_pcts = page.css("td[data-stat='win_loss_pct']").map do |per|
                   per.text.to_f
                 end

  ids = (0..29).to_a

  ids.each do |id|
    if Standing.where(team_name: team_names[id], games_played: (wins[id]+losses[id])).empty?
       #create standing value
       Standing.create!(
         team_name: team_names[id], games_played: (wins[id]+losses[id]),
         wins: wins[id], losses: losses[id], win_loss_pct: win_loss_pcts[id])
         #create cooresponding graph goal point
         Standing.create!(
           team_name: "#{team_names[id]} Goal", games_played: (wins[id]+losses[id]),
           wins: wins[id], losses: losses[id], win_loss_pct: team_benchmarks[team_names[id]])
    end
  end



end
