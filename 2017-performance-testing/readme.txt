###############################
##    Performance Testing    ##
##           and             ##
## Analysis of Qpid-Dispatch ##
###############################

Author: Bc. Jakub Stejskal
Year: 2017/2018
Last revision: 2018-05-21

Build:
============

mvn clean install  (in case of errors during the build please use -DskipTests=true)

Create packages:
mvn -P Package clean package (in case of errors during the build please use -DskipTests=true)

Created packages can be then uploaded to your machines.

Before launch the service extracted from the package (*.tar.gz), you need to specify Maestro Broker URL and log directory in ~/maestro-*/config/maestro*-service.conf.

Then you can launch services with the following command:

~/maestro-agent/bin/maestro-agent-service start
~/maestro-worker/bin/maestro-worker-service start
~/maestro-inspector/bin/maestro-inspector-service start


Run the test
============

cd /MAESTRO_WORK_DIR/maestro-test-scripts/scripts/groovy/singlepoint
groovy FixedRateTest.groovy /maestro/reports/test1

(In case of any problems, remove the groovy grapes - rm -rf ~/.groovy/grapes/org.maestro, rebuild and rerun)


Generate report
============

/MAESTRO_WORK_DIR/maestro-cli/bin/maestro-cli  report -l info -d /maestro/reports/test1



Docker utilities
============

Introduction
----

This content provides a simple way to run Maestro within containers. It is aimed at
simplifying playing with and testing maestro.

The set of components is handled by Docker Compose. While you can build everything
manually, Docker Compose is the recommended method for using these containers.

Building
----

**Note**: this part is optional and only required if you want to tweak building the
containers. You can just skip to the "Launching" topic for regular use (Docker Compose
will build the containers as required).

There are two sets of containers: one is used for building a SUT container running Apache
ActiveMQ 5.15.2 (configurable via ACTIVEMQ_VERSION argument) and another for Apache
Artemis 2.5.0 (configurable via ARTEMIS_VERSION and ARTEMIS_JOURNAL). The files are

* docker-activemq-compose.yml
* docker-artemis-compose.yml
* docker-interconnect-compose.yml


You can build the containers with:

```
 docker-compose -f docker-compose.yml -f docker-artemis-compose.yml build
```

or

```
 docker-compose -f docker-compose.yml -f docker-activemq-compose.yml build
```

or

```
 docker-compose -f docker-compose.yml -f docker-interconnect-compose.yml build
```


Launching
----

Run:

```
 docker-compose -f docker-compose.yml -f docker-artemis-compose.yml up -d
```

**Note**: on some rare occasions, the containers for the workers does not start correct.
To solve that, just rerun the up command.


Running The Tests
----

To run the tests, first start the client container:

```
docker run -it -h maestro_client -v maestro:/maestro --network=maestro_cluster -p 8000:8000 maestro_client /bin/bash
```

Once you attach to the container, the console MOTD will display useful information about
how you can tweak the tests. Please note that the name of the storage might be different or
simply an auto-generated ID from docker composer.

To execute the unbounded test, which tries to send as much data as possible to the broker,
provided by default along with Maestro, run the following commands within the container:

```
cd /opt/maestro/maestro-test-scripts/scripts/groovy/singlepoint
groovy FixedRateTest.groovy /maestro/reports/activemq-5.15.2
```

**Note**: the first test takes a longer time to run because Groovy will download the
dependencies.

After completed, the test will generate the report. The report can be accessed via the
browser and is available at http://localhost:8000/ (ie.: http://localhost:8000/activemq-5.15.2/
in the case of the test above).

The containers will store the test data in a volume which is located on `${HOME}/tmp/maestro`
by default.


Attaching to the Other Containers
----

You can use ```docker exec``` command to attach to a running container. For example, to attach
to maestro sender container:

```
docker exec -it maestro_sender_1 /bin/bash
```

Customizing The Tests
----

The tests parameters can be customized via environment variables within the container. They
usually use the same variables names and defaults, however their behavior and requirements
may change according to the test (ie.: incremental tests may required a incremental counter
variable and so on).

The defaults for the FixedRateTest are printed in the MOTD.


Customizing The Images
----

When applicable, some arguments/options may be changes.

**MAESTRO_WORKER_VERSION**

This argument can be replaced with a released version, such as `1.2.0` or with `devel` to use
the latest version build by Travis CI. By default, it always use the latest released version.


Other
----

Recreating only the client and using a custom volume:

Supposing a volume named `maestro` is already created. You can just run:

```
docker rm -f maestro_client
docker run -it -h maestro-client -v maestro:/maestro --network=maestro -p 8000:8000 maestro_client
```
