class RepoFacade
  def self.get_repos(type, user)
    repos = RepoService.repos(type, user)
    require "pry"; binding.pry
    repos.each do |repo|
      Repo.new(repo)
    end
  end
end
