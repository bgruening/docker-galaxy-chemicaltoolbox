# Galaxy - ChemicalToolBox

FROM bgruening/galaxy-stable:17.05

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND=ChemicalToolBox

# Include all needed scripts and libraries from the host
# compressed archives will be extracted automatically
#ADD ./Jmoleditor.tar.bz2 /galaxy-central/

# ToDo: run simpleHTTPServer from startup
#RUN rm /usr/bin/startup
#ADD ./startup.sh /usr/bin/startup
#RUN chmod +x /usr/bin/startup

ADD chemicaltoolbox_tools.yml $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml && \
    /tool_deps/_conda/bin/conda clean --tarballs
