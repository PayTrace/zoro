module Zoro
  module FieldName
    def self.make_field(name)
      # clean_up = name.gsub(/_/, ' ')
      clean_up = clean_up.gsub(/=/, '')

      words = clean_up.split 
      words.map do |w|
        w.capitalize
      end.join(" ")
    end
  end
end
