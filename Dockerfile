FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    valgrind \
    git \
    vim \
    && apt-get clean

WORKDIR /app

COPY . /app

RUN echo '#!/bin/bash\n'\
'gcc -g -Wall -Wextra -Werror -D BUFFER_SIZE=42 get_next_line.c get_next_line_utils.c main.c -o gnl' \
> /app/compile.sh && chmod +x /app/compile.sh

ENTRYPOINT ["/bin/bash"]

