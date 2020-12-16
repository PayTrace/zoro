module Zoro
  module FieldName
    def self.make_field(name)
      name.gsub(/=/, '')
    end
  end
end
