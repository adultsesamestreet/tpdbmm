FROM tinymediamanager/tinymediamanager:latest

ARG TPDB_PLUGIN_VERSION=v2.0.1
ARG TPDB_PLUGIN_JAR=ThePornDB-TinyMediaManager-Plugin.jar
ARG TPDB_PLUGIN_URL="https://github.com/ThePornDatabase/TinyMediaManager-Plugin/releases/download/${TPDB_PLUGIN_VERSION}/${TPDB_PLUGIN_JAR}"

USER root

# Bundle the TPDB plugin directly into common tinyMediaManager addon paths at build time.
RUN set -eux; \
    mkdir -p /tmp/tpdb-plugin \
             /app/addons \
             /opt/tinyMediaManager/addons \
             /home/tmm/addons; \
    curl -fsSL "${TPDB_PLUGIN_URL}" -o "/tmp/tpdb-plugin/${TPDB_PLUGIN_JAR}"; \
    install -m 0644 "/tmp/tpdb-plugin/${TPDB_PLUGIN_JAR}" "/app/addons/${TPDB_PLUGIN_JAR}"; \
    install -m 0644 "/tmp/tpdb-plugin/${TPDB_PLUGIN_JAR}" "/opt/tinyMediaManager/addons/${TPDB_PLUGIN_JAR}"; \
    install -m 0644 "/tmp/tpdb-plugin/${TPDB_PLUGIN_JAR}" "/home/tmm/addons/${TPDB_PLUGIN_JAR}"; \
    rm -rf /tmp/tpdb-plugin

USER tmm
