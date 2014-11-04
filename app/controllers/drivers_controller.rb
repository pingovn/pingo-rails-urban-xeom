class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    #@drivers = Driver.all
    #respond_with(@drivers)
    @search = Driver.search(params[:q])
    @drivers = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
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
    respond_with(@driver,location: driver_session_path)
  end

  def update
    @driver.update(driver_params)
    respond_with(@driver)
  end

  def destroy
    @driver.destroy
    respond_with(@driver)
  end

  def search
    @search = Driver.search(params[:q])
    @search_drivers = @search.result  
  end

  private
    def set_driver
      @driver = Driver.find(params[:id])
    end

    def driver_params
      params.require(:driver).permit(:email,:password,:last_name, :address, :phone, :birthday, :gender, :driver_license, :job, :email, :avatar)
    end
end
