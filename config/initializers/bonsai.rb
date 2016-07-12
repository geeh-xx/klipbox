if ENV['heroku config:set BONSAI_URL=https://8vjyyjjpf8:ameu48pruh@rangels-first-sandbo-2302849557.us-east-1.bonsai.io']
  Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['heroku config:set BONSAI_URL=https://8vjyyjjpf8:ameu48pruh@rangels-first-sandbo-2302849557.us-east-1.bonsai.io'], logs: true})
end