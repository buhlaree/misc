class CashDispenser
  def self.localize(language)
    require_relative "./lang/#{language}.rb"
    self
  end

  def self.bill_counter(total)
    original_request = total
    bills = {}
    session_hash = {}
    left_over = $available
    NOMINALS.each do |item|
      bills[item.to_s.to_sym] = 0
    end
    $available.each do |key, value|
      bill_type = key.to_s.to_i
      number_available = value
      number_needed = (total / bill_type)
      if number_available.zero?
        bills[key] = 0
      elsif number_needed <= number_available
        bills[key] = number_needed
        total -= (bill_type * number_needed)
        left_over[key] = (value - number_needed)
      else
        actual = number_available
        bills[key] = actual
        total -= (bill_type * actual)
        left_over[key] = actual - actual
      end
    end
    session_hash[:bills] = bills
    session_hash[:total] = total
    session_hash[:left_over] = left_over
    session_hash[:original_request] = original_request
    session_hash
  end

  def self.bill_dispenser(hash)
    if hash[:total] != 0
      puts 'There are not enough bills to fulfill your request!'
      puts "Do you want to receive the partial amount of #{CASH_SYMBOL}#{(hash[:original_request] - hash[:total])}? y or n"
      response = gets.chomp
      if response == 'y'
        puts 'Dispensing...'
        hash[:bills].each do |key, value|
          puts "#{value} #{CASH_SYMBOL} #{key}" + (value == 1 ? ' bill' : ' bills') unless value == 0
        end
        $available = hash[:left_over]
      elsif response == 'n'
        puts 'Thank you. Have a nice day.'
      else
        puts "I'm sorry, I do not understand your response!"
      end
    elsif hash[:total] <= CASH_LIMIT
      puts 'Dispensing...'
      hash[:bills].each do |key, value|
        puts "#{value} #{CASH_SYMBOL} #{key}" + (value == 1 ? ' bill' : ' bills') unless value == 0
      end
      $available = hash[:left_over]
    else
      puts "I'm sorry, that is over the withdrawal limit of #{CASH_SYMBOL}#{CASH_LIMIT}"
    end
  end
end
