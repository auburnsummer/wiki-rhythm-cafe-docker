FROM mediawiki:1.43.11

COPY logo.svg /var/www/html/resources/assets/rdlogo.svg
COPY LocalSettings.php /var/www/html/LocalSettings.php

RUN git clone --depth 1 --branch REL1_43 \
      https://gerrit.wikimedia.org/r/mediawiki/extensions/CodeMirror \
      /var/www/html/extensions/CodeMirror

RUN git clone --depth 1 --branch v4.1.0 \
      https://github.com/StarCitizenTools/mediawiki-extensions-TabberNeue.git \
      /var/www/html/extensions/TabberNeue