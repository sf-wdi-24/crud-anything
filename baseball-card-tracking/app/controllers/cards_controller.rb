class CardsController < ApplicationController

  before_filter :authorize

  def index
    @cards = Card.all
  end

  def new
  end

  def update
  end

  def destroy
    @card = Card.find(params[:id])
    puts @card.id
    if @card.destroy
        redirect_to user_cards_path(current_user), notice: "Card deleted."
    end
  end

  def edit
  end

  def create
  end

  def show
  end
end
