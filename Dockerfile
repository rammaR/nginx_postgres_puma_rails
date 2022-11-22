#syntax=docker/dockerfile:1

FROM ruby:2.5

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get update -qq && apt-get install -y nodejs \
    postgresql-client && apt-get clean \ && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn@1

RUN mkdir rails_app
WORKDIR /rails_app

COPY rails_app/Gemfile /rails_app/Gemfile
COPY rails_app/Gemfile.lock /rails_app/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
# COPY rails_app/entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

#COPY sidekiq-entrypoint.sh /rails_app/

EXPOSE 3000

# RUN SECRET_KEY_BASE=1 RAILS_ENV=production bundle exec rake assets:precompile

# RUN bundle exec spring binstub --all

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]