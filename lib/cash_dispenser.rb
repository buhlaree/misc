# CashDispenser class contains bill_counting and bill_dispenser methods
class CashDispenser
  NOMINALS = [100, 50, 20, 10, 5, 1].freeze
  CASH_LIMIT = 5000
  CASH_SYMBOL = '$'.freeze

  # Define a bill counting method with a default parameter value of "nil"
  def self.bill_counter(total = nil)
    return 'You did not enter a cash amount' if total.nil?
    total = total.to_i.abs
    # Prevents a withdrawal amount over the limit
    return 'The daily cash limit is $5000' if total > 5000
    # An array to store the numbers of each type of bill
    number_of_bills = []
    # Algorithm to store number of $100, $50, $20, $10, $5, $1 bills in an array
    NOMINALS.each do |item|
      number_of_bills.push(total / item)
      total -= ((total / item) * item)
    end
    number_of_bills
  end

  # Define a method that takes a 6 value array as a parameter and puts out a
  # list of the number of each type of bill.
  def self.bill_dispenser(bill_array)
    # Creates a 2-dimensional array from number_of_bills and types_of_bills
    number_and_types = bill_array.zip(NOMINALS)
    # Deletes instances where there are no bills of a certain type
    number_and_types.delete_if { |item| item[0].zero? }
    # Iterates through the revised number_and_types array and decides whether to
    # print "bill" or "bills" depending on the plural use of the word.
    response = []
    number_and_types.each do |item|
      if item[0] == 1
        response.push("#{item[0]} #{CASH_SYMBOL}#{item[1]} bill")
      else
        response.push("#{item[0]} #{CASH_SYMBOL}#{item[1]} bills")
      end
    end
    response
  end
end
