require 'elasticsearch/model'
class Article < ActiveRecord::Base
  Elasticsearch::Model.client = Elasticsearch::Client.new log: true
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :title, message: "deve ser preenchido"
  validates_presence_of :text, message: "deve ser preenchido"

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :text, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title^10', 'text']
                }
            },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    title: {},
                    text: {}
                }
            }
        }
    )
  end
end
# Boas praticas

# Deleta os indices previos do Elasticsearch
Article.__elasticsearch__.client.indices.delete index: Article.index_name rescue nil

# criando novos mapas de indexes
Article.__elasticsearch__.client.indices.create \
  index: Article.index_name,
  body: { settings: Article.settings.to_hash, mappings: Article.mappings.to_hash }

# indexando todos os registro de banco no indexe do elasticsearch
Article.import