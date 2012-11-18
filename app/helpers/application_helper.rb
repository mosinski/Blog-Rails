module ApplicationHelper
  def avatar_url(comment)
    default_url = "http://astropolis.xaa.pl/images/avatars/gallery/avatar.png"
    gravatar_id = Digest::MD5::hexdigest(comment.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
  end

  def title(page_title)
  content_for(:title) { page_title }
  end


  def coderay(text) 
    text.gsub!(/\<code(?: lang="(.+?)")?\>(.+?)\<\/code\>/m) do 
      code = CodeRay.scan($2, $1).div(:css => :class)
      "<notextile>#{code}</notextile>" 
    end 
    return text.html_safe 
  end

end
