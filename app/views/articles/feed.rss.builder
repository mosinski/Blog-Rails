atom_feed :language => 'en-US' do |feed|
  feed.title "Mosinski Blog"
  feed.updated @articles.first.accepted
              
  @articles.each do |article|
    feed.entry article, :published => article.accepted do |entry|
      entry.title article.title
      entry.summary article.teaser + '<br /><br />Read the full article: <a href="' + article_url(article) + '">' + article_url(article) + '</a><br /><br />', :type => 'html'
      
    end
  end
end

