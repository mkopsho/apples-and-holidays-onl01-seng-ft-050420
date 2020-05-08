require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end
  
def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts season.to_s.capitalize + ":"
    holidays.each do |holiday, supplies| # I feel pretty gross about all this text manipulation. Is there a better way?
      puts "  " + holiday.to_s.split("_").map(&:capitalize).join(" ") + ": " + supplies.join(", ") # Do more reading on `map(&:); it's apparently a "hack" to use the preceding enumberable...`
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbqs = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbqs << holiday
      end
    end
  end
  bbqs
end
