FROM fluent/fluentd:v0.12.18

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
RUN fluent-gem install fluent-plugin-elasticsearch -v 1.9.3 --no-document \
    && fluent-gem install fluent-plugin-parser --no-document \
    && fluent-gem install fluent-plugin-rewrite-tag-filter --no-document

USER root

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
