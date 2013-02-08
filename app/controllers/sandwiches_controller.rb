class SandwichesController < ApplicationController
  # GET /sandwiches
  # GET /sandwiches.json
  def index
    @sandwiches = Sandwich.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sandwiches }
    end
  end

  # GET /sandwiches/1
  # GET /sandwiches/1.json
  def show
    @sandwich = Sandwich.find(params[:id])
    quote_request = Typhoeus::Request.get("http://www.iheartquotes.com/api/v1/random?format=text")
    @quote = quote_request.body.split("http:")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sandwich }
    end
  end

  # GET /sandwiches/new
  # GET /sandwiches/new.json
  def new
    @sandwich = Sandwich.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sandwich }
    end
  end

  # GET /sandwiches/1/edit
  def edit
    @sandwich = Sandwich.find(params[:id])
  end

  # POST /sandwiches
  # POST /sandwiches.json
  def create
    @sandwich = Sandwich.new(params[:sandwich])

    respond_to do |format|
      if @sandwich.save
        send_sandwich_notification
        format.html { redirect_to root_path, notice: 'Sandwich Order was successfully created.' }
        format.json { render json: @sandwich, status: :created, location: @sandwich }
      else
        format.html { render action: "new" }
        format.json { render json: @sandwich.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sandwiches/1
  # PUT /sandwiches/1.json
  def update
    @sandwich = Sandwich.find(params[:id])

    respond_to do |format|
      if @sandwich.update_attributes(params[:sandwich])
        format.html { redirect_to @sandwich, notice: 'Sandwich was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sandwich.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sandwiches/1
  # DELETE /sandwiches/1.json
  def destroy
    @sandwich = Sandwich.find(params[:id])
    @sandwich.destroy

    respond_to do |format|
      format.html { redirect_to sandwiches_url }
      format.json { head :no_content }
    end
  end

  private

  def send_sandwich_notification
    short_url = sandwich_url(@sandwich)

    if Rails.env.production?
      Bitly.use_api_version_3
      bitly = Bitly.new("o_6jq46k5fro", "R_ebc59fffb8247aebc474402254182912")
      request = bitly.shorten(short_url)
      short_url = request.short_url
    end

    Twitter.direct_message_create("eggplantpluto",
                                  "Wich-Wizard sandwich request! #{short_url} :)")
  end
end
