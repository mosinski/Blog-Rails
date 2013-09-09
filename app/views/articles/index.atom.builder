atom_feed do |feed|
  feed.title "Miłosz Osiński Blog"
  feed.updated @articles.first.created_at

  @articles.each do |article|
    feed.entry article do |entry|
      entry.title article.title
      entry.content simple_format(article.body.lines.first+"<br>"), :type => 'html'

      entry.author do |author|
        author.name "Miłosz Osiński"
      end
    end
  end
end
