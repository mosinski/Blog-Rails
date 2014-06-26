# encoding: UTF-8
class ArticlesController < ApplicationController
   USER_ID, PASSWORD = ENV['HTTP_USER'] || 'Administrator', ENV['HTTP_PASSWORD'] || 'password'
   before_filter :authenticate, :only => [ :new, :edit, :destroy ]

  def index
    @articles = Article.page(params[:page]).per_page(5).search(params[:search], params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @articles }
      format.atom
      format.xml  { render :xml => @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.body = coderay(@article.body)
    Visit.track(@article, request.remote_ip)

    respond_to do |format|
      format.html
      format.json { render json: @article }
      format.pdf {
        html = render_to_string(:layout => false , :action => "show.html.erb", :formats => [:html], :handler => [:erb])
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/application.css"
        send_data(kit.to_pdf, :filename => "#{@article.title}.pdf", :type => 'application/pdf')
        return
      }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        @newsletters = Newsletter.all
        if @newsletters != NIL
          @newsletters.each do |newsletter|
            NewsletterMailer.newsletter_sender(newsletter, @article).deliver
          end
        end
        format.html { redirect_to @article, notice: "Dodano nowy artykuł '#{@article.title}'" }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: "Zaktualizowano artykuł '#{@article.title}'" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == USER_ID && password == PASSWORD
    end
  end

  def feed
    @articles = Article.all.order('accepted desc')

    respond_to do |format|
      format.atom
    end
  end
end
