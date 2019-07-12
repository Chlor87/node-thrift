FROM thrift

ENV NODE_VERSION="v12.6.0"
ENV NODE_NAME="node-$NODE_VERSION-linux-x64"
ENV YARN_NAME="yarn_1.17.2_all.deb"
ENV PATH="/src/$NODE_NAME/bin:$PATH"

WORKDIR /src

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-transport-https wget \
    && wget --no-check-certificate https://github.com/yarnpkg/yarn/releases/download/v1.17.2/$YARN_NAME && dpkg -i $YARN_NAME \
    && wget --no-check-certificate https://nodejs.org/dist/$NODE_VERSION/$NODE_NAME.tar.gz \
    && tar xzf $NODE_NAME.tar.gz \
    && rm -rf $YARN_NAME $NODE_NAME.tar.gz \
    && apt-get remove -y --purge apt-transport-https wget

CMD ["node"]
