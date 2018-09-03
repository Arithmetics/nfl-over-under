# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(name: "Brock Tillotson",
             email: "brock.m.tillotson@gmail.com",
             password: "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end






Bet.create!(title: "Dallas Cowboys",
            benchmark: 8.5,
            locked: false)


Bet.create!(title: "New York Giants",
            benchmark: 7.5,
            locked: false)

Bet.create!(title: "Philadelphia Eagles",
            benchmark: 10.5,
            locked: false)

Bet.create!(title: "Washington Redskins",
            benchmark: 7.5,
            locked: false)


Bet.create!(title: "Chicago Bears",
            benchmark: 6.5,
            locked: false)

Bet.create!(title: "Detroit Lions",
            benchmark: 7.5,
            locked: false)


Bet.create!(title: "Green Bay Packers",
            benchmark: 10.5,
            locked: false)


Bet.create!(title: "Minnesota Vikings",
            benchmark: 10.5,
            locked: false)


Bet.create!(title: "Atlanta Falcons",
            benchmark: 9.5,
            locked: false)

Bet.create!(title: "Carolina Panthers",
            benchmark: 8.5,
            locked: false)

Bet.create!(title: "New Orleans Saints",
            benchmark: 9.5,
            locked: false)


Bet.create!(title: "Tampa Bay Buccaneers",
            benchmark: 6.5,
            locked: false)

Bet.create!(title: "Los Angeles Rams",
            benchmark: 10.5,
            locked: false)

Bet.create!(title: "San Francisco 49ers",
            benchmark: 8.5,
            locked: false)

Bet.create!(title: "Arizona Cardinals",
            benchmark: 5.5,
            locked: false)

Bet.create!(title: "Seattle Seahawks",
            benchmark: 7.5,
            locked: false)

Bet.create!(title: "Buffalo Bills",
            benchmark: 5.5,
            locked: false)

Bet.create!(title: "Miami Dolphins",
            benchmark: 6.5,
            locked: false)


Bet.create!(title: "New England Patriots",
            benchmark: 11.5,
            locked: false)

Bet.create!(title: "New York Jets",
            benchmark: 5.5,
            locked: false)


Bet.create!(title: "Baltimore Ravens",
            benchmark: 8.5,
            locked: false)

Bet.create!(title: "Cincinnati Bengals",
            benchmark: 6.5,
            locked: false)


Bet.create!(title: "Cleveland Browns",
            benchmark: 5.5,
            locked: false)

Bet.create!(title: "Pittsburgh Steelers",
            benchmark: 10.5,
            locked: false)

Bet.create!(title: "Houston Texans",
            benchmark: 8.5,
            locked: false)


Bet.create!(title: "Indianapolis Colts",
            benchmark: 6.5,
            locked: false)

Bet.create!(title: "Jacksonville Jaguars",
            benchmark: 9.5,
            locked: false)

Bet.create!(title: "Tennessee Titans",
            benchmark: 7.5,
            locked: false)

Bet.create!(title: "Denver Broncos",
            benchmark: 7.5,
            locked: false)


Bet.create!(title: "Kansas City Chiefs",
            benchmark: 8.5,
            locked: false)

Bet.create!(title: "Los Angeles Chargers",
            benchmark: 9.5,
            locked: false)

Bet.create!(title: "Oakland Raiders",
            benchmark: 7.5,
            locked: false)


#set up variables
@users = User.all
@bets = Bet.all
bet_ids = (1..30).to_a

#give each better 5 super bets and 5 regular votes
@users.each do |user|
  selected_bets = @bets.shuffle[0..9]

  super_bets = selected_bets[0..4]
  reg_bets = selected_bets[5..9]

  super_bets.each do |bet|
    user.picks.create!(title: bet.title,
                       benchmark: bet.benchmark,
                       locked: bet.locked,
                       super: true,
                       bet_id: bet.id,
                       selection: ["under", "over"].sample)
  end

  reg_bets.each do |bet|
    user.picks.create!(title: bet.title,
                       benchmark: bet.benchmark,
                       locked: bet.locked,
                       super: false,
                       bet_id: bet.id,
                       selection: ["under", "over"].sample)
  end

end


team_names = [
  "Dallas Cowboys",
  "New York Giants",
  "Philadelphia Eagles",
  "Washington Redskins",
  "Chicago Bears",
  "Detroit Lions",
  "Green Bay Packers",
  "Minnesota Vikings",
  "Atlanta Falcons",
  "Carolina Panthers",
  "New Orleans Saints",
  "Tampa Bay Buccaneers",
  "Los Angeles Rams",
  "San Francisco 49ers",
  "Arizona Cardinals",
  "Seattle Seahawks",
  "Buffalo Bills",
  "Miami Dolphins",
  "New England Patriots",
  "New York Jets",
  "Baltimore Ravens",
  "Cincinnati Bengals",
  "Cleveland Browns",
  "Pittsburgh Steelers",
  "Houston Texans",
  "Indianapolis Colts",
  "Jacksonville Jaguars",
  "Tennessee Titans",
  "Denver Broncos",
  "Kansas City Chiefs",
  "Los Angeles Chargers",
  "Oakland Raiders"
]


# standings 
team_names.each do |team|
  6.times do |n|
    games_played = n
    if n == 0
      wins = 0
      losses = 0
    else
      last_wins = Standing.last.wins
      last_losses = Standing.last.losses
      winz = [true, false].sample
      if winz
        wins = last_wins + 1
        losses = last_losses
      else
        wins = last_wins
        losses = last_losses + 1
      end
      win_loss_pct = wins.to_f / games_played.to_f
    end


    Standing.create!(
                     team_name: team,
                     games_played: games_played,
                     wins: wins,
                     losses: losses,
                     win_loss_pct: win_loss_pct
                     )

    Standing.create!(
                     team_name: "#{team} Goal",
                     games_played: games_played,
                     wins: wins,
                     losses: losses,
                     win_loss_pct: (@bets.find_by_title(team).benchmark.to_f / 16)
                     )


  end
end
