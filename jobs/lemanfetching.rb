require "net/http"
require "uri"
require 'digest/md5'
require 'time'

oldCheckSum = 0;

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '10s', :first_in => 0 do |job|
    r = Time.now.to_i;
    response = Net::HTTP.get_response("live.fiawec.com","/proxy.php?file=1/live/data.js&cache=" + r.to_s)
    checksum = Digest::MD5.hexdigest(response.body);

    if checksum != oldCheckSum
        send_event('lemandata',{data: response.body});
        oldCheckSum = checksum;
    end
end