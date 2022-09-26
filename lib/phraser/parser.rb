require "pragmatic_tokenizer"

module Phraser
  class Parser
    SPLIT_REGEX = /^[.!?:;\[\]()]+$/
    attr_accessor :files

    def initialize(files)
      @files = files
    end

    def count(words: 3, results: 100)
      hash = Hash.new(0)
      self.class.to_segments(text).each do |phrase|
        phrase.each_cons(words) do |w|
          hash[w.join(" ")] += 1
        end
      end
      hash.max_by(results) { |k, v| v }
    end

    def text
      files.map { |f| File.read(f) }.join("\n\n")
    end

    def self.to_segments(text)
      segments = []
      PragmaticTokenizer::Tokenizer.new.tokenize(text).chunk do |token|
        SPLIT_REGEX.match?(token) # split on boundaries
      end.each do |split, words|
        next if split
        words = words.select { |w| /[[:alnum:]]/.match?(w) } # remove punctuation
        segments << words unless words.empty?
      end
      segments
    end
  end
end
