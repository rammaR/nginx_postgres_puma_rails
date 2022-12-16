class CookiesController < ApplicationController
  before_action :set_cooky, only: %i[ show edit update destroy ]

  # GET /cookies or /cookies.json
  def index
    @cookies = Cookie.all
  end

  # GET /cookies/1 or /cookies/1.json
  def show
  end

  # GET /cookies/new
  def new
    @cooky = Cookie.new
  end

  # GET /cookies/1/edit
  def edit
  end

  # POST /cookies or /cookies.json
  def create
    @cookie = Cookie.new(cookie_params)

    respond_to do |format|
      if @cooky.save
        format.html { redirect_to cookie_url(@cookie), notice: "Cookie was successfully created." }
        format.json { render :show, status: :created, location: @cookie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cookie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cookies/1 or /cookies/1.json
  def update
    respond_to do |format|
      if @cooky.update(cookie_params)
        format.html { redirect_to cooky_url(@cookie), notice: "Cookie was successfully updated." }
        format.json { render :show, status: :ok, location: @cookie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cooky.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookies/1 or /cookies/1.json
  def destroy
    @cooky.destroy

    respond_to do |format|
      format.html { redirect_to cookies_url, notice: "Cookie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooky
      @cooky = Cookie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cookie_params
      params.require(:cookie).permit(:flavor, :price)
    end
end
