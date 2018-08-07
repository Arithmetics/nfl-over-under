# NBA Over / Under

Application I built to host a competition to pick NBA Over/Under win totals and follow standings over the course of the season.

Live website running at: https://bt-nba.herokuapp.com/ (Account will need to be created to login).

Technologies used:
* Ruby on Rails 5
* Bootstrap 3
* Heroku
* Scheduled jobs 

### Features:

### User Profiles:
![User Profile](https://i.imgur.com/nSNm77t.png)
Users picks 10 games, picks are private until admin closes contest.

### Live Leaderboard:
![Leaderboard](https://i.imgur.com/1Up8Nz5.png)
Leaderboard updates and reorders daily as NBA standings change.

###  Daily Updated Pick Tracker:
![PickTracker](https://i.imgur.com/cYlQzhZ.png)
Heroku scheduled rake task checks NBA standings every morning, updates live graphs, and updates projections.


## Local Installation:

1. Clone github branch:
> git clone git@github.com:Arithmetics/nba-app.git

2. Install:
> bundle install

3. Update seeds.rb file (if neccessary)
> rails db:migrate
(optional)
> rails db:seed


## Comments:

This was my first unguided web app, and therefore I have many issues and areas I have improved on in the future, never the less it works and is running successfully in production!


### Future Improvements/Retrospective:

1. Models are not associated in an effieicent manner. Picks, bets, and users all could be rearranged in the "Rails way".
2. Views are horribly repetative and not DRY. Needs a full partial rework.
3. Tests are almost non-existent. Will not make this mistake again, very difficult to write them after the fact!
