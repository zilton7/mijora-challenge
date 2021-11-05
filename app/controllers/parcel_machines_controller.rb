class ParcelMachinesController < ApplicationController
  def index
    @parcel_machines = ParcelMachine.all
  end
end
