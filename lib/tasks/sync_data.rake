namespace :sync_data do
  desc 'Synchronize database with data from API'
   task :sync => :environment do
      data = HTTParty.get('https://www.omniva.lt/locations.json')
      data.each do |d|
        new_record_data = generate_new_record(d)
        record = ParcelMachine.where(zip: d["ZIP"]).take!
        next unless ParcelMachine.different?(record,  ParcelMachine.new(new_record_data))

        record.update(new_record_data)
        puts "#{record.zip}: updated"
        
        rescue ActiveRecord::RecordNotFound
          ParcelMachine.create(new_record_data)
          puts "#{new_record_data[:zip]}: created"

      end
      Update.create!()
    end
end

def generate_new_record(data)
{ 
      name: data["NAME"],
    zip: data["ZIP"],
    pm_type: data["TYPE"],
    a0_name: data["A0_NAME"],
    a1_name: data["A1_NAME"],
    a2_name: data["A2_NAME"],
    a3_name: data["A3_NAME"],
    a4_name: data["A4_NAME"],
    a5_name: data["A5_NAME"],
    a6_name: data["A6_NAME"],
    a7_name: data["A7_NAME"],
    a8_name: data["A8_NAME"],
    x_coordinate: data["X_COORDINATE"],
    y_coordinate: data["Y_COORDINATE"],
    service_hours: data["SERVICE_HOURS"],
    service_hours_until: data["SERVICE_HOURS_UNTIL"],
    service_hours_2: data["SERVICE_HOURS_2"],
    service_hours_2_until: data["SERVICE_HOURS_UNTIL_2"],
    comment_est: data["comment_est"],
    comment_eng: data["comment_eng"],
    comment_rus: data["comment_rus"],
    comment_lav: data["comment_lav"],
    comment_lit: data["comment_lit"],
    modified: data["MODIFIED"]
 }
end