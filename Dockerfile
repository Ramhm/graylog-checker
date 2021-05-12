FROM  ubuntu:20.04

MAINTAINER Ramin Hakimi <ram.hakimi@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y vim curl netcat telnet && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

CMD echo -e '{"version": "1.1","host":"$HOSTNAME","short_message":"Graylog Checker - TCP","full_message":"Backtrace here\n\nmore stuff","level":1,"_user_id":9001,"_some_info":"foo","_some_env_var":"bar"}\0' | nc -w 1 $HOST $PORT & \
    echo -e '{"version": "1.1","host":"$HOSTNAME","short_message":"Graylog Checker - UDP","full_message":"Backtrace here\n\nmore stuff","level":1,"_user_id":9001,"_some_info":"foo","_some_env_var":"bar"}\0' | nc -w 1 -u $HOST $PORT
