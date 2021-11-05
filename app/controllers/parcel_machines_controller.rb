class ParcelMachinesController < ApplicationController
  before_action :set_parcel_machine, only: %i[ show ]

  def index
    if params['search']
      @parcel_machines = search(params['search'])
    else
      @parcel_machines = ParcelMachine.page params[:page]
    end
  end

  def show
  end

  private

  def search(q)
    ParcelMachine.where("name LIKE ? OR zip LIKE ? OR a1_name LIKE ?\
      OR a2_name LIKE ? OR a3_name LIKE ? OR a5_name LIKE ? OR a7_name LIKE ?", 
        "%#{q}%", "%#{q}%", "%#{q}%","%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%").page params[:page]
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_parcel_machine
    @parcel_machine = ParcelMachine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parcel_machine_params
    params.fetch(:parcel_machine, {}).permit(:search)
  end
end
