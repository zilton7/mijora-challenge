module ParcelMachinesHelper
  def link_to_csv
    link_to "Download CSV", parcel_machines_path(format: "csv", 
      search: request.query_parameters['search']), 
        class: 'd-flex justify-content-center mb-2'
  end
end
