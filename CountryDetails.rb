module CountryCriteria
  def eligible_for_loan?
    if @state_of_country.upcase == 'DEVELOPING' || @state_of_country.upcase == 'UNDERDEVELOPED'
      puts 'Eligible to get loan from IMF or World Bank'
    else
      puts 'Not eligible to get loan from IMF or World Bank'
    end
  end

  def seat_in_uns?
    if @gdp >= 8 && @army_strength >= 100
      puts 'Eligible to get seat in UNS'
    else
      puts 'NOT Eligible to get seat in UNS'
    end
  end


end

module CountryStrength
  def win?
    if @army_strength >= 80
      puts "You are going to definitly win!!!"
    else
      puts 'Need to increaase army strength'
    end
  end
end

class Country
  include CountryCriteria
  prepend CountryStrength
  attr_accessor :population, :gdp, :states, :army_strength, :state_of_country
  def initialize(population, gdp, states, army_strength, state_of_country)
    @population = population
    @gdp = gdp
    @states = states
    @army_strength = army_strength
    @state_of_country = state_of_country
  end
end
=begin
india = Country.new(21.4, 8, 28, 120, "developing")
india.eligible_for_loan?
india.seat_in_uns?
india.win?
=end
is_country = false
while true
  puts 'Enter choice: '
  puts '1.Enter country data '
  puts '2.Is country eligible to get loan from World Bank or IMF?'
  puts '3.Is country able to secure place in UNS?'
  puts '4.Is country able to win from enemy?'
  puts  'Enter any number to exit'
    case gets.chomp.to_i
    when 1
      puts 'Enter population, GDP, number of states, army strength(200-1), state of country'
      country = Country.new(gets.chomp.to_i, gets.chomp.to_f, gets.chomp.to_i, gets.chomp.to_i, gets.chomp)
      is_country = true
    when 2
      if is_country
        country.eligible_for_loan?
      else
        puts 'Enter country details'
      end
    when 3      
      if is_country
        country.seat_in_uns?
      else
        puts 'Enter country details'
      end
    when 4
      if is_country
        country.win?
      else
        puts 'Enter country details'
      end
    else
      break
  end
end
