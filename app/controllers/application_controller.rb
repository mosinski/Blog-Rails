class ApplicationController < ActionController::Base
  protect_from_forgery

  def coderay(text)
    text.gsub(/<code( lang="(.+?)")?>(.+?)<\/code>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
end
