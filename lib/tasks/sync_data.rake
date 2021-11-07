namespace :sync_data do
  desc'Synchronize database with data from API'
   task :sync => :environment do
      data = HTTParty.get('https://www.omniva.lt/locations.json')
      data.each do |d|
        new_data = { 
          "name" => d["NAME"],
          "zip" => d["ZIP"],
          "pm_type" => d["TYPE"],
          "a0_name" => d["A0_NAME"],
          "a1_name" => d["A1_NAME"],
          "a2_name" => d["A2_NAME"],
          "a3_name" => d["A3_NAME"],
          "a4_name" => d["A4_NAME"],
          "a5_name" => d["A5_NAME"],
          "a6_name" => d["A6_NAME"],
          "a7_name" => d["A7_NAME"],
          "a8_name" => d["A8_NAME"],
          "x_coordinate" => d["X_COORDINATE"],
          "y_coordinate" => d["Y_COORDINATE"],
          "service_hours" => d["SERVICE_HOURS"],
          "service_hours_until" => d["SERVICE_HOURS_UNTIL"],
          "service_hours_2" => d["SERVICE_HOURS_2"],
          "service_hours_2_until" => d["SERVICE_HOURS_UNTIL_2"],
          "comment_est" => d["comment_est"],
          "comment_eng" => d["comment_eng"],
          "comment_rus" => d["comment_rus"],
          "comment_lav" => d["comment_lav"],
          "comment_lit" => d["comment_lit"],
          "modified" => d["MODIFIED"]
        }
        record = ParcelMachine.where(zip: d["ZIP"]).first
          unless record.nil?
            if ParcelMachine.different?(record, ParcelMachine.new(new_data))
              record.update(new_data)
              p 'updated'
            else
              p 'no difference'
            end
          else
            ParcelMachine.create(new_data)
            p 'created'
          end
      end
      Update.create!()
    end
end