ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,
  :user_name            => "mosinski.blog.newsletter@gmail.com",  
  :password             => "Z1mnac0la",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}
ActionMailer::Base.default_url_options[:host] = "mosinskiblog.herokuapp.com"