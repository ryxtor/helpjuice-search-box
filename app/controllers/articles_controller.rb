class ArticlesController < ApplicationController
  def index
    @articles = if params[:search]
                  Article.where('title ILIKE ?', "%#{params[:search]}%")
                else
                  Article.all
                end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
