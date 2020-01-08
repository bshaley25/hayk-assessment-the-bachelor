require 'pry'
require 'json'
constestants = JSON.parse(File.read('spec/fixtures/contestants.json'))

def get_first_name_of_season_winner(data, season)
  data.each do |season_number, contestant_data|
    if season == season_number
      contestant_data.each do |specific_contestant|
        if specific_contestant["status"] == "Winner"
          name_array = specific_contestant["name"].split
          return name_array[0]
        end
      end
    end
  end
end

#p get_first_name_of_season_winner(constestants, "season 18")

def get_contestant_name(data, occupation)
  data.each do |season_number, contestant_data|
    contestant_data.each do |specific_contestant|
      if specific_contestant["occupation"] == occupation
        return specific_contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_number, contestant_data|
    contestant_data.each do |specific_contestant|
      if specific_contestant["hometown"] == hometown
        counter += 1
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |season_number, contestant_data|
    contestant_data.each do |specific_contestant|
      if specific_contestant["hometown"] == hometown
        return specific_contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  average_array = []
  data.each do |season_number, contestant_data|
    if season == season_number
      contestant_data.each do |specific_contestant|
        average_array << specific_contestant["age"].to_f
      end
    end
  end
  return (average_array.sum / average_array.length).round
end

p get_average_age_for_season(constestants, 'season 10')