module ArticlesHelper
  def coderay(text) 
    text.gsub!(/\<code(?: lang="(.+?)")?\>(.+?)\<\/code\>/m) do 
      code = CodeRay.scan($2, $1).div(:line_numbers => :table)
      "<notextile>#{code}</notextile>" 
    end 
    return text.html_safe 
  end
end
