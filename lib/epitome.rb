require "epitome/version"

require "epitome/document"
require "epitome/corpus"

module Epitome
  def self.summarize(texts)
    Corpus.new(texts.map { |text| Document.new(text) })
  end
end

