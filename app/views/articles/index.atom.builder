atom_feed do |feed|
  feed.title "Mosinski Blog"
  feed.updated @articles.first.created_at

  @articles.each do |article|
    feed.entry article do |entry|
      entry.title article.title
      entry.content simple_format(article.body[0..200]), :type => 'html'

      entry.author do |author|
        author.name "Miłosz Osiński"
      end
    end
  end
end
