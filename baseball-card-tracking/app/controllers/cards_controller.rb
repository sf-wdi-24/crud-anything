class CardsController < ApplicationController
  require './lib/tasks/EbayApiCall'

  def apiSearch(searchQuery, graded)
    EbayApiCall.new.find_by_keywords(searchQuery, graded)
  end

  def index
    if params[:search]
      @cards = apiSearch(params[:search], params[:graded])
    else
      @cards = nil
    end
  end

  def new
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def create
  end

  def show
  end
end
