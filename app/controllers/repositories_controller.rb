class RepositoriesController < ApplicationController
  
  def index
    @github = GithubService.new({"access_token" => session[:token]})
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
    @repos_array = @github.get_repos
    # debugger
  end

  def create
    @github = GithubService.new({"access_token" => session[:token]})
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @github.create_repo(params[:name])
    redirect_to '/'
end
end
