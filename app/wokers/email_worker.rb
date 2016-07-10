require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {db: 1}
end

Sidekiq.configure_server do |config|
  config.redis = {db: 1}
end

class EmailWorker
  include Sidekiq::Worker

  def envioEmail()

    @users = User.all
    @users.each do |user|
      @articles = Article.search params[:user.word]
      ContactMailer.contact_message(params[:user]).deliver
    end
  end
end