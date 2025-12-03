FROM fluent/fluentd:v1.16-debian-1

USER root

# Remove old plugin (optional)
RUN gem uninstall fluent-plugin-elasticsearch -a -x || true

# Install correct Elasticsearch client for ES 7.x
RUN gem install elasticsearch -v 7.17.10 --no-document
RUN gem install elasticsearch-transport -v 7.17.10 --no-document

# Install Elasticsearch output plugin for Fluentd (correct version)
RUN gem install fluent-plugin-elasticsearch -v 5.3.0 --no-document

COPY fluent.conf /fluentd/etc/fluent.conf

USER fluent
