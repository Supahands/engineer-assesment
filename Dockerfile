# syntax=docker/dockerfile:1
FROM ruby:2.7.5

RUN apt-get update -qq && apt-get upgrade -y && \
apt-get install -y nodejs postgresql-client

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile

# delete the lock file and bundle install again so that the console can work, but leave it in or docker won't build right for running
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install 

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["nodemon", "--exec", "rails", "server", "-b", "0.0.0.0"]

