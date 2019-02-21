require 'net/http'
require 'json'

class GithubApi

  def initialize
    @base_url = URI("https://api.github.com")
  end

  def list_user_repos(username:)
    url_path = "/users/#{username}/repos"
    repos = request(url_path)
    repos.map{ |repo| repo.fetch('name') }
  end

  private

  def request(url_path)
    net = Net::HTTP.new(@base_url.host, @base_url.port)
    net.use_ssl = true
    response = net.request_get(url_path)

    unless response.is_a?(Net::HTTPSuccess)
      raise "Failed to query github: #{response.body}"
    end
    JSON.parse(response.body)
  end

end