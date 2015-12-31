class SearchQueriesController < ApplicationController
  require './lib/tasks/EbayApiCall'

  def apiSearch(searchQuery, grade_company, year, manufacturer, grade, save)
    EbayApiCall.new.find_by_keywords(searchQuery, grade_company, grade, year, manufacturer, current_user.id, save)
  end

  def index
    if params[:player]
      @results = apiSearch(params[:player], params[:grade_company], params[:grade], params[:year], params[:manufacturer], false)
      @query_exists = SearchQuery.where(user_id: current_user.id).where(player: params[:player]).where(grade_company: params[:grade_company]).where(grade: params[:grade]).where(year: params[:year]).where(manufacturer: params[:manufacturer]).count
    else
      @results = nil
    end
  end

  def create
    search_query = SearchQuery.new(player: params[:player], grade_company: params[:grade_company], grade: params[:grade], year: params[:year], manufacturer: params[:manufacturer])
    search_query.user_id = current_user.id
    if search_query.save
      #apiSearch(params[:player], params[:grade_company], params[:grade], params[:year], params[:manufacturer], true)
      redirect_to user_path(current_user)
    else
      flash[:error] = search_query.errors.full_messages.join(", ")
      redirect_to '/search'
    end
  end

end
