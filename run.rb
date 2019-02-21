#!/usr/bin/env ruby
require './github_api'

@username = ARGV[0]

if @username.nil?
  puts "Usage: #{__FILE__} username"
else
  puts GithubApi.new.list_user_repos(username: @username)
end