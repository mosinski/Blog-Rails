class CommentsController < ApplicationController

   USER_ID, PASSWORD = ENV['HTTP_USER'], ENV['HTTP_PASSWORD']
   before_filter :authenticate, :only => [ :show ]


  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    if @comment.ip == request.remote_ip
    elsif
    redirect_to(request.env["HTTP_REFERER"], :notice => 'Nie masz uprawnien.')
    end
  end

  # POST /comments
  # POST /comments.json
def create
  @article = Article.find(params[:article_id])
   if ((params[:dzien_tygodnia]).downcase! == (I18n.l Time.now, :format => "%A"))
    @comment = @article.comments.build(params[:comment])
    @comment.ip = request.remote_ip
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@article, :notice => 'Komentarz dodany') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { redirect_to(@article, :notice => 'Komentarz nie dodano. Puste pola.')}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
   else
    redirect_to(@article, :notice => 'Podano bledny dzien tygodnia.')
   end
  end

  # PUT /comments/1
  # PUT /comments/1.json
def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@article, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
def destroy
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
if @comment.ip == request.remote_ip
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(@article, :notice => 'Comment was successfully deleted.') }
      format.xml  { head :ok }
    end
else
    redirect_to(@article, :notice => 'Nie masz uprawnien.')
end

  end

private
   def authenticate
      authenticate_or_request_with_http_basic do |id, password| 
          id == USER_ID && password == PASSWORD
      end
   end
end
