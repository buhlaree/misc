class CashDispenser

  # Define a bill counting method with a default parameter value of "nil"
  def self.bill_counter(total=nil)

  return "You did not enter a cash amount" if total == nil

  total = total.to_i if total.is_a?(Float)

  # Distinguishes between a number string and a word string and converts the
  # number string to an integer if it exists.  Otherwise returns a message.
  if total.is_a?(String)
    if total.to_i == 0 && total.length > 0
      return "Please input the amount to be withdrawn in digits"
    end
    if total.to_i != 0
    total = total.to_i
    end
  end

  # Prevents a withdrawal amount over the limit
  return "The daily cash limit is $5000" if total > 5000

  # Prevents negative integers from entering the algorithm
  total = total.abs

  # Algorithm to store number of $100, $50, $20, $10, $5, $1 bills in an array
  number_of_bills = [] # An array to store the numbers of each type of bill
  hundreds = total / 100
  number_of_bills.push(hundreds)
  fifties = (total - hundreds * 100) / 50
  number_of_bills.push(fifties)
  twenties = (total - hundreds * 100 - fifties * 50) / 20
  number_of_bills.push(twenties)
  tens = (total - hundreds * 100 - fifties * 50 - twenties * 20) / 10
  number_of_bills.push(tens)
  fives = (total - hundreds * 100 - fifties * 50 - twenties * 20 - tens * 10) / 5
  number_of_bills.push(fives)
  ones = (total - hundreds * 100 - fifties * 50 - twenties * 20 - tens * 10 - fives * 5)
  number_of_bills.push(ones)
  end

  # Define a method that takes a 6 value array as a parameter and puts out a
  # list of the number of each type of bill.
  def self.bill_dispenser (bill_array)
    # Defines an array of the 6 most common USD denominations
    types_of_bills = ["$100", "$50", "$20", "$10", "$5", "$1"]
    # Creates a 2-dimensional array from number_of_bills and types_of_bills
    number_and_types = bill_array.zip(types_of_bills)
    # Deletes all instances in the number_and_types array where there are no bills
    # of a certain denomination
    number_and_types.delete_if {|item| item[0] == 0}
    # Iterates through the revised number_and_types array and decides whether to
    # print "bill" or "bills" depending on the plural use of the word.
    number_and_types.each {|item| if item[0] == 1
                          puts item[0].to_s + " " + item[1] + " bill"
                          else
                          puts item[0].to_s + " " + item[1] + " bills"
                          end
                          }
    end

end

