class ParcelMachinesController < ApplicationController
  before_action :set_parcel_machine, only: %i[ show ]

  def index
    if params['search'] && params['search'].length > 0
      @parcel_machines = ParcelMachine.search(params['search']).page params[:page]
    else
      @parcel_machines = ParcelMachine.page params[:page]
    end

    respond_to do |format|
      format.html
      format.csv { send_data ParcelMachine.to_csv(params['search']), filename: "parcel-machines-#{Time.now.strftime("%Y-%m-%d %H.%M.%S")}.csv" }
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_parcel_machine
    @parcel_machine = ParcelMachine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parcel_machine_params
    params.fetch(:parcel_machine, {}).permit(:search)
  end
end
