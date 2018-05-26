# encoding: UTF-8
class CommentsController < ApplicationController
   USER_ID, PASSWORD = ENV['HTTP_USER'], ENV['HTTP_PASSWORD']
   before_action :authenticate, only: :show

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.ip == request.remote_ip
    elsif
    redirect_to(request.env["HTTP_REFERER"], notice: 'Nie masz uprawnień!')
    end
  end

  def create
    @article = Article.find(params[:article_id])

    if ((params[:dzien_tygodnia]).downcase! == (I18n.l Time.now, format: "%A"))
      @comment = @article.comments.build(params[:comment])
      @comment.ip = request.remote_ip
      respond_to do |format|
        if @comment.save
          format.html { redirect_to(@article, notice: 'Komentarz pomyślnie dodany') }
          format.xml  { render xml: @article, status: :created, location: @article }
        else
          format.html { redirect_to(@article, notice: 'Komentarz nie dodano. Nie wypełniono wymaganych pól.')}
          format.xml  { render xml: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to(@article, notice: 'Podano błedny dzień tygodnia!')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@article, notice: 'Zaktualizowano komentarz pomyślnie.') }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xml: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
    if @comment.ip == request.remote_ip
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to(@article, notice: 'Komentarz został usunięty.') }
        format.xml  { head :ok }
      end
    else
      redirect_to(@article, notice: 'Nie masz uprawnień!')
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == USER_ID && password == PASSWORD
    end
  end
end
