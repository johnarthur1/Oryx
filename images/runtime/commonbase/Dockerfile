ARG DEBIAN_FLAVOR
FROM buildpack-deps:${DEBIAN_FLAVOR}-curl

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		xz-utils \
	&& rm -rf /var/lib/apt/lists/*

COPY --from=support-files-image /tmp/oryx/ /tmp/oryx 