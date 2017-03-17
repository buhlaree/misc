require "cash_dispenser"

describe CashDispenser do
  describe ".bill_counter" do
    context "given a integer number" do
      it "returns a 6 value array" do
        expect(CashDispenser.bill_counter(2431)).to eql([24,0,1,1,0,1])
      end
    end

    context "given a decimal number" do
      it "returns a 6 value array" do
        expect(CashDispenser.bill_counter(2431.00)).to eql([24,0,1,1,0,1])
      end
    end

    context "given a number string" do
      it "returns a 6 value array" do
        expect(CashDispenser.bill_counter("2431")).to eql([24,0,1,1,0,1])
      end
    end

    context "given a word string" do
      it "returns an error message" do
        expect(CashDispenser.bill_counter("two thousand")).to eql("Please input the amount to be withdrawn in digits")
      end
    end

    context "given no method argument" do
      it "returns an error" do
        expect(CashDispenser.bill_counter()).to eql("You did not enter a cash amount")
      end
    end

    context "given an amount of cash over $5000" do
      it "returns a message" do
        expect(CashDispenser.bill_counter(5001)).to eql("The daily cash limit is $5000")
      end
    end
     
    context "given a negative integer, decimal, or number string" do
      it "converts the negative to a positive value" do
        expect(CashDispenser.bill_counter(-2431)).to eql([24,0,1,1,0,1])
      end
    end
end
end
