class SearchesController < ApplicationController
  def index
    @trending = Search.trending
  end

  def search_history
    @searches = current_user.searches.order(updated_at: :desc)
  end
end
