  client = Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'] || 'https://8vjyyjjpf8:ameu48pruh@rangels-first-sandbo-2302849557.us-east-1.bonsai.io'

  unless Article.__elasticsearch__.index_exists?
    Article.__elasticsearch__.create_index! force: true
    Article.import
  end
