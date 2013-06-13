class NewsletterMailer < ActionMailer::Base
    default :from => "Mi&#322;osz Osi&#324;ski Blog <mosinski.blog.newsletter@gmail.com>" , :content_type => "multipart/mixed"
  def newsletter_sender(newsletter,article)
    @article = article
    @newsletter = newsletter  
    mail(:to => newsletter.email, :subject => "Nowy!")  
  end 
end
