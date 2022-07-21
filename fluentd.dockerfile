FROM fluentd:v1.14.0-1.0

USER root

RUN fluent-gem install elasticsearch -v 7.15
RUN fluent-gem install fluent-plugin-elasticsearch

COPY fluentd\conf\fluentd.conf /fluentd/etc/fluent.conf