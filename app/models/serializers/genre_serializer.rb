module Serializers
  class GenreSerializer
    # Rubyオブジェクトを変換
    def self.dump(objects)
      objects.map { |object|
        if object.is_a?(Values::Genre::Base)
          object
        else
          klass = "Values::Genre::#{object['type']}".constantize
          klass.new(**object.except("type").symbolize_keys)
        end
      }.to_json
    end

    # Rubyオブジェクトに変換
    def self.load(json)
      objects = json.is_a?(Array) ? json : JSON.parse(json || "[]")
      objects.map do |object|
        klass = "Values::Genre::#{object['type']}".constantize
        klass.new(**object.except("type").symbolize_keys)
      end
    end
  end
end
