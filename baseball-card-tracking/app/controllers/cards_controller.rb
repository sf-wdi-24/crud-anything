class CardsController < ApplicationController
  require './lib/tasks/EbayApiCall'
  # def search
  #   @api_response = EbayApiCall.new.find_by_keywords("mickey mantle", "bgs")
  #   puts api_response
  # end

  def index
    @cards = EbayApiCall.new.find_by_keywords("mickey mantle", "bgs")
    puts @cards
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
