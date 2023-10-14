# Define the base image
FROM ruby:3.2.2

# Set the working directory inside the container
WORKDIR /app

# Set the environment variables
ENV RAILS_ENV=development

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      nodejs

# Copy project files to the working directory
COPY . /app

# Install Ruby dependencies
RUN bundle install

# Expose port 3000 of the container
EXPOSE 3000

# Default command to start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
