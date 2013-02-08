class SandwichOrdersController < ApplicationController
  # GET /sandwich_orders
  # GET /sandwich_orders.json
  def index
    @sandwich_orders = SandwichOrder.all

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

  private

  def send_sandwich_notification
    short_url = sandwich_order_url(@sandwich_order)

    if Rails.env.production?
      Bitly.use_api_version_3
      bitly = Bitly.new("o_6jq46k5fro", "R_ebc59fffb8247aebc474402254182912")
      request = bitly.shorten(short_url)
      short_url = request.short_url
    end

    dm = Twitter.direct_message_create("eggplantpluto",
                                       "Wich-Wizard sandwich request! #{short_url} :)")

    @notification_message = "A notification has been sent to #{dm.attrs[:recipient][:name]}." if dm
  end
end
