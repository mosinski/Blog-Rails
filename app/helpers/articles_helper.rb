module ArticlesHelper
  def coderay(text)  
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do  
      CodeRay.scan($3, $2).div(:line_numbers => :table) 
    end  
  end  
end
