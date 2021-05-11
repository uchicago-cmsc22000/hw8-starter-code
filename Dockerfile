FROM gcc:9.3

# Download Redis
WORKDIR /tmp
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xzf redis-stable.tar.gz

# Build and install Redis
WORKDIR /tmp/redis-stable/
RUN make
RUN make install

# Clean up
RUN rm -rf /tmp/redis-stable/ /tmp/redis-stable.tar.gz

# Command to run when container is launched
CMD ["redis-server", "--bind", "0.0.0.0"]