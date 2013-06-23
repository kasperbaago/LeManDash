require 'forecast_io'

Forecast::IO.api_key = ''

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2m', :first_in => 0 do |job|
    forecast = Forecast::IO.forecast(47.957402, 0.214105);
    send_event('lmwhetherdata',{data: forecast.currently});
end