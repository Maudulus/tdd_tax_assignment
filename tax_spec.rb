require 'rspec'
require_relative 'person_income'
require 'pry'
require 'csv'

  counter = 0
  people = []
  CSV.foreach('tax_data.csv', headers: true) do |row|
    people << PersonIncome.new(row["first_name"],row["last_name"],row["annual_income"].to_f,row["tax_paid"].to_f,row["tax_rate"].to_f)
  end

  people.each do |summarize|
    puts summarize.summary
  end



describe PersonIncome do

  it "tests if the person's name in person_income array is correct " do
    expect(people[0].first_name).to eq("Johnny")
  end


  it "tests if the person's name in person_income array is correct " do
    expect(people[1].first_name).to eq("Jane")
  end

  it "tests if the person's income in person_income array is correct " do
    expect(people[2].annual_income).to eq(200000)
  end

   it "tests if the person's tax_paid in person_income array is correct " do
    expect(people[3].tax_paid).to eq(8800)
  end

  it "tests if the person's tax_rate in person_income array is correct " do
    expect(people[3].tax_rate).to eq(18)
  end

  it "tests if summary will puts something" do
    expect(people[0].summary).to eq("Johnny Smith owes 17600.0")
  end

  it "tests if the declared tax-owed for a citizen is correct " do
    expect(people[4].tax_owed).to eq(15120)
  end

   it "tests if the declared tax-owed for a citizen is correct " do
    expect(people[3].tax_owed).to eq(-1600)
  end

   it "tests if the declared tax-owed for a citizen is correct " do
    expect(people[0].tax_owed).to eq(17600)
  end



  it "tests if the refunded amount for a citizen is correct" do
    expect(people[3].tax_refunded).to eq(1600)
  end

  it "tests if the refunded amount for a citizen is correct" do
    expect(people[2].tax_refunded).to eq(0)
  end


end
