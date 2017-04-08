require_relative './cash_dispenser.rb'
puts 'Please pick your country'
puts ' Type "en" for US, "ro" for Romania, or "uk" for Ukraine:'
#gets.chomp == ("en" || "ro" || "uk")? (language = gets.chomp) : (puts "Invalid Selection")
language = gets.chomp
if language != "en" && language != "ro" && language != "uk"
  return
end
puts 'How much cash would you like to withdraw?'
response = gets.chomp.to_i


#CashDispenser.localize(language).bill_counter(response).bill_dispenser()
CashDispenser.bill_dispenser(CashDispenser.localize(language).bill_counter(response))
