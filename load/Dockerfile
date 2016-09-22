FROM nowait/java:openjdk8-alpine

WORKDIR /src
COPY . .
RUN chmod +x *.jar runjava.sh

ENTRYPOINT ["/src/runperftest.sh"]
