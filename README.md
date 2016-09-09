A Docker Image to run Ruby/Sinatra
========================================

### An Example Dockerfile

    FROM andyvanee/docker-rb-sinatra
    ADD . /usr/src/app

This can be built and run for development (with hot-reloading) like this:

    docker build . -t myapp
    docker run -i -t --rm                \
                --name myapp             \
                -p 3000:80               \
                -v $(pwd):/usr/src/app   \
                -e APP_FILE=app.rb       \
                -e RACK_ENV=development  \
                myapp

To run in production, you would use something more like this:

    docker run -d --name myapp -p 80:80 -e APP_FILE=app.rb myapp

There are a few assumptions:

- Your own gems are installed by adding `RUN gem install ...` in your Dockerfile
- A Rakefile is provided and `rake test` runs your tests. Minitest is assumed <http://recipes.sinatrarb.com/p/testing/minitest>
