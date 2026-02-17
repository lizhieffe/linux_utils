# A minimum dockerfile just contains the bash
#
# Build: docker build -t minimum .
# Run: docker run -it minimum

# Step 1: Use the ultra-lightweight Alpine Linux
FROM alpine:latest

# Step 2: Install bash, git, ssh client, and common web/editing utilities
RUN apk add --no-cache bash git openssh-client curl wget nano vim

# Step 3: Set the default working directory to /home
WORKDIR /home

# Step 4: Set bash as the default command
CMD ["/bin/bash"]
