#!/usr/bin/env ruby

require 'rest-firebase'

firebase = RestFirebase.new(
  site: 'https://hacker-news.firebaseio.com/',
  auth: false,
  max_retries: 3,
  log_method: method(:puts)
)

es = firebase.event_source('v0/topstories')

es.onerror do |error|
  puts "ERROR: #{error}"
end

es.onreconnect do
  !!@start
end

es.onmessage do |event, data|
  next unless event == 'put'
  news_id = data['data'].first
  news = firebase.get("v0/item/#{news_id}")
  puts news['title']
end

puts "Starting..."
@start = true
es.start

r, w = IO.pipe

Signal.trap('INT') do
  @start = false
  es.close
  es.wait
  w.puts
  w.close
end

r.gets
