json.array!(@drivers) do |driver|
  json.extract! driver, :id, :first_name, :last_name, :address, :phone, :birthday, :gender, :driver_license, :job
  json.url driver_url(driver, format: :json)
end
