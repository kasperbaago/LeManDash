require "net/http"
require "uri"
require 'digest/md5'
require 'time'

oldCheckSum = 0;

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2m', :first_in => 0 do |job|
    r = Time.now.to_i;
    response = Net::HTTP.get_response("api.forecast.io","forecast/0f98af51949d8c23ca31f35b968568b4/47.957402,0.214105?cache=" + r.to_s)
    checksum = Digest::MD5.hexdigest(response.body);

    if checksum != oldCheckSum
        send_event('lmwhetherdata',{data: response.body});
        oldCheckSum = checksum;
    end
end