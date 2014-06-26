Blog::Application.routes.draw do
  resources :newsletters

  resources :articles do
    resources :comments
  end

  get '/feed' => 'articles#feed.rss', :as => :feed, :defaults => { :format => 'atom' }
  get '/about' => 'static#about'
  get '/contact' => 'static#contact'
  get '/zgloszenie' => 'newsletters_#rezygnuje'
  get '/newsletters/new' => 'articles#index'
  root :to => "articles#index"
end
