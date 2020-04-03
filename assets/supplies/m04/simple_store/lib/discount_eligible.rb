module DiscountEligible

  def has_discount?
    days_to_expire >= 0 && days_to_expire <= 30
  end

  def discount_percentage
    if has_discount?
      -(0.6/30) * days_to_expire + 0.6
    else
      0
    end
  end

  #
  # @return [Fixnum] The number of days until the product expiration date.
  #
  def days_to_expire
    # TODO
  end

  #
  # @return [Float] The amount of discount, with at most 2 decimal places.
  #
  def discount_amount
    # TODO
  end

  #
  # @return [Float] the price of the product considering the discount_amount.
  # The value must be rounded to at most 2 decimal places.
  #
  def discounted_price
  end
end
