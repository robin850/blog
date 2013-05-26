atom_feed :language => 'fr-FR' do |feed|
  feed.title "Robin Dupret - Blog"

  @articles.each do |article|

    feed.entry(article) do |entry|
      entry.url article_path(article)
      entry.title article.title
      entry.content raw(markdown(article.body)), :type => 'html'

      entry.updated(article.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
    end

  end
end
