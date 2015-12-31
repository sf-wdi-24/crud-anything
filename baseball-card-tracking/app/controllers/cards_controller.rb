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
  end

  def edit
  end

  def create
  end

  def show
  end
end
