require "naturalingo/version"
require "redis"

module Natural
  
  class Lingo
    attr_reader :heard, :talking_to_me

    def initialize(names)
      @names ||= names
      @talking_to_me = false
    end

    def heard=sentences
      @heard ||= sentences
      analyze
    end

    def talking_to_me?
      return @talking_to_me
    end

    def analyze
      # process each sentence at a time
      @heard.split(/[\.!]/).each do |sentence|
        sentence.split(' ').each do |word|
          remember(word, sentence)
          recognize(word)
        end
      end
    end

    def recognize(word)
      # name
      if @names.index word 
        @talking_to_me = true
      end

    end

    def remember(word, sentence)
      $redis.sadd("nl:#{word}", sentence)
    end

    def list(word)
      $redis.smembers(word) do |sentence|
        puts sentence
      end
    end

  end

end

$redis = Redis.new
$redis = Redis.new(:host => "127.0.0.1", :port => 6379)