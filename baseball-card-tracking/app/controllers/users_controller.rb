class UsersController < ApplicationController
  
  before_filter :authorize, except: [:new, :create]
  before_filter :current_user_logged_in, except: [:index, :show, :edit, :show_user_cards, :show_user_search_queries, :show_user_search_query]

  def index
    @users = User.all
  end

  def new
    
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
    @searchQueries = SearchQuery.where(user_id: @user.id)
    @cards = Card.where(user_id: @user.id)
  end

  def show_user_cards
    @user = User.find(params[:id])
    @card_groupings = Card.where(user_id: @user.id).group_by {|c| c.search_query_id}
    @card_search_query = SearchQuery.where(user_id: @user.id).group_by {|c| c.id}
  end

  def show_user_search_queries
    @user = User.find(params[:id])
    @searchQueries = SearchQuery.where(user_id: @user.id)
    @cards = Card.where(user_id: @user.id)
  end

  def show_user_search_query
    @searchQuery = SearchQuery.find(params[:id])
    @user_id = @searchQuery.user_id
    @cards = Card.where(user_id: @user_id)
    @cards_for_column_chart = Card.where(user_id: @user_id).where(search_query_id: @searchQuery.id).group(:price).count(:id).sort_by { |k,v| k }
    array = Array.new
    @cards_for_column_chart.each do |p, ts|
        array.push(["#{p}", ts])
    end
    data_table = GoogleVisualr::DataTable.new

    # Add Column Headers
    data_table.new_column('string', 'Price' )
    data_table.new_column('number', 'Total Sold')

    # Add Rows and Values
    data_table.add_rows(
      array
    )

    option = { width: 1200, height: 240, colors:['#c33838'], :legend => "none",
      :backgroundColor => '#f8f8f8',
      title: "Total '#{@searchQuery.search_query}' Cards Sold at Respective Prices",
      hAxis: {
          format: 'currency',
          title: "Price",
          baselineColor: "none",
          gridlines: {color: "#f8f8f8"}
        },
        vAxis: {
          baselineColor: "#f8f8f8",
          gridlines: {color: "#f6f6f6"}
        }
      }
    @cards_column_chart = GoogleVisualr::Interactive::ColumnChart.new(data_table, option)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_params = params.require(:user).permit(:name, :email, :password)
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
        redirect_to signup_path, notice: "User deleted."
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
