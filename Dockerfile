FROM mediawiki:1.43.11

RUN --mount=type=bind,from=ghcr.io/php/pie:bin,source=/pie,target=/usr/local/bin/pie \
    export DEBIAN_FRONTEND="noninteractive"; \
    set -eux; \
    # Add the `unzip` package which PIE uses to extract .zip files.
    apt-get update; \
    apt-get install -y --no-install-recommends unzip; \
    # Use PIE to install an extension...
    pie install --no-cache \
        wikimedia/excimer; \
    # Clean up `unzip`.
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false unzip; \
    rm -rf /var/lib/apt/lists/*;


COPY logo.svg /var/www/html/resources/assets/rdlogo.svg
COPY LocalSettings.php /var/www/html/LocalSettings.php

RUN git clone --depth 1 --branch REL1_43 \
      https://gerrit.wikimedia.org/r/mediawiki/extensions/CodeMirror \
      /var/www/html/extensions/CodeMirror

RUN git clone --depth 1 --branch v4.1.0 \
      https://github.com/StarCitizenTools/mediawiki-extensions-TabberNeue.git \
      /var/www/html/extensions/TabberNeue

RUN git clone --depth 1 --branch REL1_43 \
      https://gerrit.wikimedia.org/r/mediawiki/extensions/TemplateStyles \
      /var/www/html/extensions/TemplateStyles

RUN git clone --depth 1 --branch REL1_43 \
      https://gerrit.wikimedia.org/r/mediawiki/extensions/MobileFrontend \
      /var/www/html/extensions/MobileFrontend

