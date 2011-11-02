require "naturalingo/version"
require "redis"

module Naturalingo

  def self.heard(sentences)
    # process each sentence at a time
    sentences.split(/[\.!]/).each do |sentence|
      # break down each sentence into words
      puts "sentence = #{sentence}"
      sentence.split(' ').each do |word|
        puts "word = #{word}"
        $redis.sadd(word, sentence)
      end


      # send to the "Brain"
    end

    return nil

  end

end

$redis = Redis.new
$redis = Redis.new(:host => "127.0.0.1", :port => 6379)

Naturalingo::heard("Hi my name is Etienne!")