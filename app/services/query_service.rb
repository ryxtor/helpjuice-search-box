class QueryService
  def initialize(user, query)
    @user = user
    @query = query
  end

  def generate
    last_search = fetch_last_search
    if last_search && similar_query?(last_search.query, normalize_query(@query))
      last_search.update(query: @query)
    else
      @user.searches.create(query: @query)
    end
  end

  private

  def fetch_last_search
    @user.searches.order(updated_at: :desc).first
  end

  def normalize_query(query)
    query.to_s.strip.downcase
  end

  def similar_query?(last_query, current_query)
    normalized_last_query = normalize_query(last_query)
    normalized_last_query.include?(current_query) || current_query.include?(normalized_last_query)
  end
end
