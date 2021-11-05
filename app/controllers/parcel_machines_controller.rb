class ParcelMachinesController < ApplicationController
  def index
    @parcel_machines = ParcelMachine.page params[:page]
  end
end
