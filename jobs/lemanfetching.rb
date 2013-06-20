require "net/http"
require "uri"

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
    prng = Random.new;
    r = prng.rand(100000);
    response = Net::HTTP.get_response("live.fiawec.com","/proxy.php?file=1/live/data.js&cache=" + r.to_s)
    send_event('lemandata',{data: response.body})
end