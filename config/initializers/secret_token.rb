Blog::Application.config.secret_token = ENV['SECRET_TOKEN'] || ('x' * 30)
Blog::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || ('x' * 30)
