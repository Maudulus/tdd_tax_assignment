class PersonIncome
  attr_accessor :first_name,:last_name,:annual_income,:tax_paid,:tax_rate


  def initialize(first_name,last_name,annual_income,tax_paid,tax_rate, person_array=[])
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
    @person_array = person_array
  end

  def tax_owed
    if tax_paid > (@annual_income * (tax_rate * 0.01 ))
      -(@tax_paid - (@annual_income*(tax_rate* 0.01))).round(2)
    elsif tax_paid == (@annual_income * (tax_rate * 0.01 ))
      0
    else
      ((@annual_income*(tax_rate* 0.01))-tax_paid).round(2)
    end
  end

  def tax_refunded
    if @tax_paid > (@annual_income * (tax_rate * 0.01 ))
      (tax_paid-(@annual_income*(@tax_rate * 0.01)))
    else
      0
    end
  end

  def add_person(person)
    @person_array << person
  end


  def summary
   # Liz Lemon owes $39,000 in taxes
    if tax_refunded > 0
      "#{@first_name} #{@last_name} will receive a refund of #{tax_refunded}"
    else
      "#{@first_name} #{@last_name} owes #{tax_owed}"
    end
  end


end
