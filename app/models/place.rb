require 'elasticsearch/model'

class Place < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	settings do
    mappings dynamic: false do
      indexes :place_name, type: :text
      indexes :place_description, type: :text, analyzer: :english
      indexes :country, type: :text, analyzer: :english
    end
  end
end
