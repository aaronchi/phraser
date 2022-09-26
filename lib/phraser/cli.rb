require "thor"
require "phraser/parser"

module Phraser
  class CLI < Thor
    desc "count FILES", "counts number of phrases in a text file"
    option :words, type: :numeric, default: 3
    option :results, type: :numeric, default: 100
    def count(*files)
      Parser.new(files).count(
        words: options[:words],
        results: options[:results]
      ).each do |k, v|
        puts "#{k} - #{v}"
      end
    end
  end
end
