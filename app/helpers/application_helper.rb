module ApplicationHelper
  def avatar_url(comment)
    default_url = "http://astropolis.xaa.pl/images/avatars/gallery/avatar.png"
    gravatar_id = Digest::MD5::hexdigest(comment.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def category_counter(link_text, link_path)
    link_full = "/articles?utf8=%E2%9C%93&search=#{link_path}"
    count = Article.find_all_by_kategoria("#{link_path}").count
    content_tag(:li) do
      content_tag(:a, link_text, href: link_full, "dir" => "ltr") +
      content_tag(:span, "dir"=> "ltr") do
        " (#{count})"
      end
    end
  end
end
