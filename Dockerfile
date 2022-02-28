# Dockerfile
FROM ruby:3.0.3

# Install runtime dependencies
RUN apt-get update -qq && apt-get install -y postgresql-client

# Copy the app's code into the container
ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

# Budnle gems
RUN bundle install --jobs 4

# Expose port 3000 from the container
EXPOSE 3000

# Run puma server
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]