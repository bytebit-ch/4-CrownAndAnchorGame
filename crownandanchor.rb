require './pythonicinput'
require 'active_support/core_ext/enumerable.rb'


bets = {

  "crown" => { bets: 0, rolls: 0 },
  "anchor" => {bets: 0, rolls: 0},
  "diamond" => {bets: 0, rolls: 0},
  "spade" => {bets: 0, rolls: 0},
  "club" => {bets: 0, rolls: 0},
  "heart" => {bets: 0, rolls: 0},
}


die_options = ["crown", "anchor", "diamond", "spade", "club", "heart"]
  
  for i in die_options
    value = pythonic_input("How much would you like to wager on #{i}?").to_i
    bets[i][:bets] = value
  end
 puts bets

rand_roll = []
count = count = 0
while count < 3
  die_options = ["crown", "anchor", "diamond", "spade", "club", "heart"]
  random_die_roll = die_options.shuffle.sample
  puts random_die_roll
  bets[random_die_roll][:rolls]+= 1
  count = count + 1
end

puts bets


earnings = []
for i in die_options
    if bets[i][:bets] != 0 && bets[i][:rolls] != 0
        x =  i, bets[i]
        puts x
        puts bets[i][:bets]
        #puts bets[i][:rolls]
        total_money_won = bets[i][:bets] * bets[i][:rolls] 
        earnings.push(total_money_won)
    end

end

earnings = earnings.sum
puts "You have won $#{earnings} "

loses = []
for i in die_options
  if bets[i][:bets] != 0 && bets[i][:rolls] == 0
    x = i, bets[i]
    puts x
    puts bets[i][:rolls]
    total_money_lost = bets[i][:bets] 
    loses.push(total_money_lost)
  end
end

loses = loses.sum
puts "You have lost $#{loses}"

total_earnings = earnings - loses

puts "Your final payout is $#{total_earnings}"