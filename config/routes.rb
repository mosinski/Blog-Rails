Blog::Application.routes.draw do
  resources :newsletters

  #resources :comments

  resources :articles do
    resources :comments
  end

  match '/feed' => 'articles#feed.rss', :as => :feed, :defaults => { :format => 'atom' }
  match '/about' => 'articles#about'
  match '/zgloszenie' => 'newsletters_#zgloszenie'
  match '/rezygnuje_z_subskrypcji' => 'newsletters_#rezygnuje'
  match '/newsletters/new' => 'articles#index'
  root :to => "articles#index"
end
