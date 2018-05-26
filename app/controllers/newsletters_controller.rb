class NewslettersController < ApplicationController
  USER_ID, PASSWORD = ENV['HTTP_USER'], ENV['HTTP_PASSWORD']
  before_action :authenticate, only: [ :index, :edit ]

  def index
    @newsletters = Newsletter.all

    respond_to do |format|
      format.html
      format.json { render json: @newsletters }
    end
  end

  def show
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @newsletter }
    end
  end

  def new
    @newsletter = Newsletter.new

    respond_to do |format|
      format.html
      format.json { render json: @newsletter }
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def create
    @newsletter = Newsletter.new(params[:newsletter])
    @newsletter.kod_dostepu = SecureRandom.hex(10)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to articles_url, notice: 'Dodano email do subskrypcji.' }
        format.json { render json: @newsletter, status: :created, location: @newsletter }
      else
        @newsletter.errors.full_messages.each do |msg|
          format.html { redirect_to articles_url, notice: msg }
          format.json { render json: @newsletter.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      if @newsletter.update_attributes(params[:newsletter])
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    respond_to do |format|
      format.html { redirect_to newsletters_url }
      format.json { head :no_content }
    end
  end

  def rezygnuje
    @newsletter = Newsletter.find_by_kod_dostepu(params[:kod_dostepu])
    if @newsletter != NIL
      @newsletter.destroy
      redirect_to articles_url, notice: 'Twoje zgloszenie zostalo zrealizowane!'
    else
      redirect_to articles_url, notice: 'Niepoprawny kod dostepu!'
    end
  end

  private

   def authenticate
      authenticate_or_request_with_http_basic do |id, password|
        id == USER_ID && password == PASSWORD
      end
   end
end
