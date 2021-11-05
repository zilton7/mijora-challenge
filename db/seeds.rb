data = HTTParty.get('https://www.omniva.lt/locations.json')

data.each do |d|
  new_data = { 
    "name" => d["NAME"],
    "zip" => d["ZIP"],
    "type" => d["TYPE"],
    "type" => d["A0_NAME"],
    "type" => d["A1_NAME"],
    "type" => d["A2_NAME"],
    "type" => d["A3_NAME"],
    "type" => d["A4_NAME"],
    "type" => d["A5_NAME"],
    "type" => d["A6_NAME"],
    "type" => d["A7_NAME"],
    "type" => d["A8_NAME"],
    "type" => d["X_COORDINATE"],
    "type" => d["Y_COORDINATE"],
    "type" => d["SERVICE_HOURS"],
    "type" => d["SERVICE_HOURS_UNTIL"],
    "type" => d["SERVICE_HOURS_2"],
    "type" => d["SERVICE_HOURS_UNTIL_2"],
    "type" => d["comment_est"],
    "type" => d["comment_eng"],
    "type" => d["comment_rus"],
    "type" => d["comment_lav"],
    "type" => d["comment_lit"],
    "type" => d["MODIFIED"]
  }
    if ParcelMachine.where(zip: d["ZIP"]).count > 0
      ParcelMachine.where(zip: d["ZIP"]).update(new_data)
      p 'updated'
    else
      ParcelMachine.create(new_data)
      p 'created'
    end
end
