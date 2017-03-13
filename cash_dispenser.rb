# This is a cash dispenser program that takes a numerical input and dispenses
# the correct denominations of bills.

# Define a method that takes a positive integer as the argument
def cash_dispenser (total)
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

  # Defines an array of the 6 most common USD denominations
  types_of_bills = ["$100", "$50", "$20", "$10", "$5", "$1"]
  # Creates a 2-dimensional array from number_of_bills and types_of_bills
  number_and_types = number_of_bills.zip(types_of_bills)
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
# Prompts for how much money needs to be withdrawn and sends the user input as
# an argument to the cash_dispenser method after converting it to an integer
puts "Welcome!  How much money would you like to withdraw?"
cash_dispenser(gets.chomp.to_i)
