class ArticlesController < ApplicationController
  before_action :process_search_query, if: -> { params[:search].present? }

  def index
    @articles = fetch_articles
  end

  private

  def process_search_query
    # Service to save the search query and avoid duplicates or similar queries
    QueryService.new(current_user, params[:search]).generate
  end

  def fetch_articles
    params[:search].present? ? Article.by_title(params[:search]) : Article.all.limit(20)
  end
end
