$available = {"100":5, "50":5, "20":5, "10":5, "5":5, "1":5}
class CashDispenser
  def self.localize(language)
    require_relative "./lang/#{language}.rb"
  end


  def self.bill_counter(total)
    bills = {}
    NOMINALS.each do |item|
      bills[item.to_s.to_sym] = 0
    end
    $available.each do |key, value|
      bill_type = key.to_s.to_i
      number_available = value
      number_needed = (total / bill_type)

      if number_available.zero?
        bills[:key] = 0
      elsif number_needed <= number_available
        bills[:key] = number_needed
        total = total - (bill_type * number_needed)
        value -= number_needed
      else
        actual = number_available
        bills[:key] = actual
        total = total - (bill_type * actual)
        value -= actual
      end
      bills
    end
  end
end


describe CashDispenser.localize('en') do
  it 'the method should require the correct localization file' do
    CashDispenser.localize('en')
    array = NOMINALS
    expect(array).to be_instance_of(Array)
  end
end

describe CashDispenser.bill_counter(1843) do
  it 'the method should create a bills hash with 0 values' do
    array = []
    bills = {}
    NOMINALS.each do |item|
      bills[item.to_s.to_sym] = 0
    end
    bills.each{|key, value| array.push(value)}
    expect(array.each.include?(0)).to be true
  end
  it 'the method should assign method variables to the keys and values of the available hash' do
    $available.each do |key, value|
      total = 1843
      bill_type = key.to_s.to_i
      number_available = value
      number_needed = (total / bill_type)
      expect(bill_type).to be_kind_of(Integer)
      expect(number_available).to be_kind_of(Integer)
      expect(number_needed).to be_kind_of(Integer)
    end
  end
  it 'the method should assign 0 to each key of the bills hash if none are available' do
    bills = {:"100"=>0, :"50"=>0, :"20"=>0, :"10"=>0, :"5"=>0, :"1"=>0}
    number_available = 0
      if number_available.zero?
        bills[:key] = 0
    end
    expect(bills[:"100"]).to eq 0
  end
  it 'the method should count the number of bills needed and add them to the bills hash' do
    bills = {:"100"=>0, :"50"=>0, :"20"=>0, :"10"=>0, :"5"=>0, :"1"=>0}
      if number_available.zero?
        bills[:key] = 0
      elsif number_needed <= number_available
        bills[:key] = number_needed
        total = total - (bill_type * number_needed)
        value -= number_needed
      else
        actual = number_available
        bills[:key] = actual
        total = total - (bill_type * actual)
        value -= actual
      end
    expect(bills[:"100"]).to eq 0
  end
end
