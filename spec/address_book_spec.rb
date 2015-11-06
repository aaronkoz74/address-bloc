require_relative '../models/address_book'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq("Ada Lovelace")
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

    # Test that AddressBook's .import_from_csv() method is working as expected
    describe "#import_from_csv" do
      it "imports the correct number of entries" do
        book.import_from_csv("entries.csv")
        book_size = book.entries.size

        # Check the size of the AddressBook.entries
        expect(book_size).to eq 5
      end

      it "imports the 1st entry" do
        book.import_from_csv("entries.csv")
        # Check the first entry
        entry_one = book.entries[0]
        check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        expect(entry_one.name).to eq "Bill"
        expect(entry_one.phone_number).to eq "555-555-4854"
        expect(entry_one.email).to eq "bill@blocmail.com"
      end

      it "imports the 2nd entry" do
        book.import_from_csv("entries.csv")
        # Check the second entry_one
        entry_two = book.entries[1]
        check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        expect(entry_two.name).to eq "Bob"
        expect(entry_two.phone_number).to eq "555-555-5415"
        expect(entry_two.email).to eq "bob@blocmail.com"
      end

      it "imports the 3rd entry" do
        book.import_from_csv("entries.csv")
        # Check the third entry
        entry_three = book.entries[2]
        check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        expect(entry_three.name).to eq "Joe"
        expect(entry_three.phone_number).to eq "555-555-3660"
        expect(entry_three.email).to eq "joe@blocmail.com"
      end

      it "imports the 4th entry" do
        book.import_from_csv("entries.csv")
        # Check the fourth entry
        entry_four = book.entries[3]
        check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        expect(entry_four.name).to eq "Sally"
        expect(entry_four.phone_number).to eq "555-555-4646"
        expect(entry_four.email).to eq "sally@blocmail.com"
      end

      it "imports the 5th entry" do
        book.import_from_csv("entries.csv")
        #Check the fifth entry
        entry_five = book.entries[4]
        check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
        expect(entry_five.name).to eq "Sussie"
        expect(entry_five.phone_number).to eq "555-555-2036"
        expect(entry_five.email).to eq "sussie@blocmail.com"
      end
    end
end