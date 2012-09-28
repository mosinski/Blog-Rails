atom_feed do |feed|
  feed.title "Mosinski Blog"
  feed.updated @articles.first.created_at

  @articles.each do |article|
    feed.entry article do |entry|
      entry.title article.title
      entry.content article.body, :type => 'html'

      entry.author do |author|
        author.name article.author
      end
    end
  end
end
