class ParcelMachine < ApplicationRecord

  def full_address
    "#{self.a5_name} #{self.a7_name} #{self.a3_name} #{self.a2_name} #{self.a1_name}"
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
    self.where("name LIKE ? OR zip LIKE ? OR a1_name LIKE ?\
      OR a2_name LIKE ? OR a3_name LIKE ? OR a5_name LIKE ? OR a7_name LIKE ?", 
        "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%")
  end
end
