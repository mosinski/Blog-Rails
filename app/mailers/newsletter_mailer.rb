class NewsletterMailer < ActionMailer::Base
    default :from => "MOB Newsletter <mosinski.blog.newsletter@gmail.com>" , :content_type => "multipart/mixed"
  def newsletter_sender(newsletter,article)
    @article = article
    @newsletter = newsletter  
    mail(:to => newsletter.email, :subject => "Nowy!")  
  end 
end
