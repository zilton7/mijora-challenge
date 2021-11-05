class ParcelMachine < ApplicationRecord

  def full_addresses
    "#{self.a5_name} #{self.a7_name} #{self.a3_name} #{self.a2_name} #{self.a1_name}"
  end
end
