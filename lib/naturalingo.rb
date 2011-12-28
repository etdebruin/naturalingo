require "naturalingo/version"
require "redis"

module Naturalingo
  extend self

  def heard(sentences)
    remember(sentences)
    return sentences
  end

  def remember(sentences)
    # process each sentence at a time
    sentences.split(/[\.!]/).each do |sentence|
      sentence.split(' ').each do |word|
        $redis.sadd('nl:#{word}', sentence)
      end
    end
  end

  def list(word)
    $redis.smembers(word) do |sentence|
      puts sentence
    end
  end

end

$redis = Redis.new
$redis = Redis.new(:host => "127.0.0.1", :port => 6379)