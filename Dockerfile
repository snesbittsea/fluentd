FROM fluent/fluentd:v0.12.18

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
RUN fluent-gem install fluent-plugin-parser --no-document \
    && fluent-gem install fluent-plugin-rewrite-tag-filter --no-document

RUN cd /tmp && \
    git clone https://github.com/guilhermef/fluent-plugin-elasticsearch.git && \
    cd fluent-plugin-elasticsearch && \
    git checkout 1e8243cba20f962a67187effa86e6fa459d33145 && \
    gem build fluent-plugin-elasticsearch.gemspec && \
    gem install fluent-plugin-elasticsearch-1.9.0.gem && \
    rm -rf /tmp/fluent-plugin-elasticsearch

USER root

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
