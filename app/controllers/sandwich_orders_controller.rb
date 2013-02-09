class SandwichOrdersController < ApplicationController
  # GET /sandwich_orders
  # GET /sandwich_orders.json
  before_filter :set_sandwich_ingredients, :only => [:new, :create]
  before_filter :set_recent_orders, :only => [:index, :new, :show]

  def set_recent_orders
    if current_user
      @user_sandwich_orders = current_user.sandwich_orders.order("created_at desc")
    end
  end

  def set_sandwich_ingredients
    @sandwich_ingredients = SandwichIngredient.all.group_by { |sandwich_ingredient| sandwich_ingredient.category }
  end

  def index
    @sandwich_orders = SandwichOrder.order("created_at desc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sandwich_orders }
    end
  end

  # GET /sandwich_orders/1
  # GET /sandwich_orders/1.json
  def show
    @sandwich_order = SandwichOrder.find(params[:id])
    quote_request = Typhoeus::Request.get("http://www.iheartquotes.com/api/v1/random?format=text")
    @quote = quote_request.body.split("http:")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sandwich_order }
    end
  end

  # GET /sandwich_orders/new
  # GET /sandwich_orders/new.json
  def new
    @sandwich_order = SandwichOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sandwich_order }
    end
  end

  # GET /sandwich_orders/1/edit
  def edit
    @sandwich_order = SandwichOrder.find(params[:id])
  end

  # POST /sandwich_orders
  # POST /sandwich_orders.json
  def create
    @sandwich_order = SandwichOrder.new(params[:sandwich_order])

    selected_ingredients = params[:ingredients] ||= []
    selected_ingredients.each do |sandwich_ingredient_id|
      @sandwich_order.sandwich_order_ingredients << SandwichOrderIngredient.new(:sandwich_ingredient_id => sandwich_ingredient_id.to_i)
    end

    respond_to do |format|
      if @sandwich_order.save
        send_sandwich_notification
        format.html { redirect_to root_path, notice: "Sandwich Order was successfully created. #{@notification_message}" }
        format.json { render json: @sandwich_order, status: :created, location: @sandwich_order }
      else
        flash[:error] = @sandwich_order.errors.full_messages.join(", ")
        format.html { render action: "new" }
        format.json { render json: @sandwich_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sandwich_orders/1
  # PUT /sandwich_orders/1.json
  def update
    @sandwich_order = SandwichOrder.find(params[:id])

    respond_to do |format|
      if @sandwich_order.update_attributes(params[:sandwich_order])
        format.html { redirect_to @sandwich_order, notice: 'Sandwich Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sandwich_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sandwich_orders/1
  # DELETE /sandwich_orders/1.json
  def destroy
    @sandwich_order = SandwichOrder.find(params[:id])
    @sandwich_order.destroy

    respond_to do |format|
      format.html { redirect_to sandwich_orders_url }
      format.json { head :no_content }
    end
  end

  def quick_order
    past_order_id = params[:id]
    @previous_order = SandwichOrder.find(past_order_id)
    @sandwich_order = SandwichOrder.new(:user_id => current_user.try(:id), :orderer_name => current_user.try(:full_name))
    @previous_order.sandwich_ingredients.each do |sandwich_ingredient|
      @sandwich_order.sandwich_order_ingredients << SandwichOrderIngredient.new(:sandwich_ingredient_id => sandwich_ingredient.id)
    end

    respond_to do |format|
      if @sandwich_order.save
        send_sandwich_notification
        format.html { redirect_to root_path, notice: "Sandwich Order was successfully created. #{@notification_message}" }
        format.json { render json: @sandwich_order, status: :created, location: @sandwich_order }
      else
        format.html { render action: "new" }
        format.json { render json: @sandwich_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def send_sandwich_notification
    short_url = sandwich_order_url(@sandwich_order)

    if Rails.env.production?
      Bitly.use_api_version_3
      bitly = Bitly.new("o_6jq46k5fro", "R_ebc59fffb8247aebc474402254182912")
      request = bitly.shorten(short_url)
      short_url = request.short_url
    end

    dm = Twitter.direct_message_create("generalthings",
                                       "Wich-Wizard sandwich request! #{short_url} :)")

    @notification_message = "A notification has been sent to #{dm.attrs[:recipient][:name]}." if dm
  end
end
