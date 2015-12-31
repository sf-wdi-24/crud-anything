class SearchQueriesController < ApplicationController
  require './lib/tasks/EbayApiCall'

  def apiSearch(searchQuery, grade_company, year, manufacturer, grade)
    EbayApiCall.new.find_by_keywords(searchQuery, grade_company, grade, year, manufacturer, current_user.id)
  end

  def index
    if params[:player]
      @results = apiSearch(params[:player], params[:grade_company], params[:grade], params[:year], params[:manufacturer])
    else
      @results = nil
    end
  end

  def create
    search_query = SearchQuery.new(player: params[:player], grade_company: params[:grade_company], grade: params[:grade], year: params[:year], manufacturer: params[:manufacturer])
    search_query.user_id = current_user.id
    if search_query.save
      redirect_to user_path(current_user)
    else
      flash[:error] = search_query.errors.full_messages.join(", ")
      redirect_to '/search'
    end
  end

end
