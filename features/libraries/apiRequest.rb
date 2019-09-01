module ApiRequest
  def get_api(url)
    @response = RestClient.get url
  end

  def api_response
    expect(@response.code).to be(200)
    result = JSON.parse(@response)
    @day_list = result["list"]
  end

  def filter_day
    @day_list.each do |day|
     date = day["dt"]
     main = day["main"]
     temp = main["temp"]

     converted_date = Time.at(date).strftime("%Y-%m-%d")
     date = Date.parse converted_date
     if date.sunday?
       temperature_celsius = temp - 273.15
       (@temperature_list ||= []) << temperature_celsius
     end
    end
  end

  def check_temperature(expected_temperature)
    puts("Temperatures are #{@temperature_list}")
    @temperature_list.each do |current_temperature|
     expect(current_temperature > expected_temperature.to_i).to be true
    end
  end
end
