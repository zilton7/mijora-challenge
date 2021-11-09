class ParcelMachine < ApplicationRecord

  def full_address
    "#{self.a5_name} #{self.a7_name}, #{self.a3_name} #{self.a2_name} #{self.a1_name}"
  end

  def self.to_csv(query=nil)
    if query
      pm_data = self.search(query)
    else
      pm_data = self.all
    end
    attributes = %w{name zip full_address}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      pm_data.find_each do |pm|
        csv << attributes.map{ |attr| pm.send(attr) }
      end
    end
  end

  def self.search(q)
    self.where("name ILIKE ? OR zip ILIKE ? OR a1_name ILIKE ? OR a0_name ILIKE ?\
      OR a2_name ILIKE ? OR a3_name ILIKE ? OR a5_name ILIKE ? OR a7_name ILIKE ?", 
        "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%")
  end

  def self.different?(record_a, record_b)
   (record_a.attributes.to_a - record_b.attributes.to_a).map(&:first).count > 3
  end

end
