require "scalpel"
require "securerandom"

module Epitome
  class Document
    attr_reader :id
    attr_reader :text
    def initialize(text)
      @id = SecureRandom.uuid
      text = Scalpel.cut text.gsub(/[“”]/,'"').gsub('’',"'")
      i = 0
      while i < text.length && i + 1 != text.length
        while text[i].count('"').odd? && text.length > 1
          text[i] = "#{text[i]} #{text[i + 1]}"
          text.slice! i + 1
        end
        i += 1
      end
      @text = text
    end
  end
end
