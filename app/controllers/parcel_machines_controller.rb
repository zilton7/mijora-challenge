class ParcelMachinesController < ApplicationController
  def index
    if params['search']
      @parcel_machines = search(params['search'])
    else
      @parcel_machines = ParcelMachine.page params[:page]
    end
  end

  private
  def search(q)
    ParcelMachine.where("name LIKE ? OR zip LIKE ? OR a1_name LIKE ?\
      OR a2_name LIKE ? OR a3_name LIKE ? OR a5_name LIKE ? OR a7_name LIKE ?", 
        "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%").page params[:page]
  end
end
