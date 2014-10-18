class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @drivers = Driver.all
    respond_with(@drivers)
  end

  def show
    respond_with(@driver)
  end

  def new
    @driver = Driver.new
    respond_with(@driver)
  end

  def edit
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.save
    respond_with(@driver)
  end

  def update
    @driver.update(driver_params)
    respond_with(@driver)
  end

  def destroy
    @driver.destroy
    respond_with(@driver)
  end

  private
    def set_driver
      @driver = Driver.find(params[:id])
    end

    def driver_params
      params.require(:driver).permit(:first_name, :last_name, :address, :phone, :birthday, :gender, :driver_license, :job, :email, :avatar)
    end
end
