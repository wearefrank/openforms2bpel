# Contributing

# Docker-compose
The docker-compose development environment is designed to be flexible and composable. This prevents the need for developers to run the entire stack eventhough their work requires only a small part of the stack. For this we make use of a docker-compose feature that merges a given array of docker-compose files together. Simply provide a `-f ./docker-compose.<application>.yml` argument for each docker-compose file you wish to include in the `docker-compose up`command.

To run the entire stack the command would be `docker-compose -f ./docker-compose.zaakbrug.dev.yml -f ./docker-compose.zaakbrug.staging.dev.yml -f ./docker-compose.openzaak.dev.yml -f ./docker-compose.openforms.dev.yml up --build`

> WARNING: It is important to use `host.docker.internal` instead of the usual `localhost`. The url-validator that is used by most components with invalidate any urls that contain only a hostname. It requires a full canonical domain name.

#### Webgui's
The webgui's of the different components are only accesible through a dedicated Nginx reverse-proxy at `host.docker.internal:9000`.
| Url | Component |
| --- | --- |
| host.docker.internal:9000/zaakbrug/ | Zaakbrug. |
| host.docker.internal:9000/zaakbrug/staging/ | Internal tailored "staging"/"cache" OpenZaak instance. |
| host.docker.internal:9000/openzaak/ | OpenZaak. |
| host.docker.internal:9000/openforms/ | Open Formulieren. |

#### Api's
Most components also have their own Nginx proxy that is exposed to the Docker host. This is mostly to make use of X-Sendfile functionality and to more closely simulate production infrastructure. X-Sendfile allows applications to redirect and delegate the request for a file to the webserver. It is generally a much more performant way to transfer files. 

| Url | Component |
| --- | --- |
| host.docker.internal:8080/ | ZaakBrug. |
| host.docker.internal:9001/ | OpenZaak. |
| host.docker.internal:9003/ | Open Formulieren. |

## docker-compose.zaakbrug.dev
Contains an instance of ZaakBrug built locally from source and a Nginx reverse proxy is used to provide access to the different components in the stack. By default Nginx is exposed on port `9000`.

ZaakBrug Console can accessed from `host.docker.internal:9000/zaakbrug/`  
ZaakBrug is also exposed on `host.docker.internal:8080/`

#### Configuration
By default ZaakBrug uses a filebased H2 database for storing the last used zaak and documenten identifiers. To facilitate easy swapping between development with docker-compose and the Frank!Runner, the default mount for the database file is `../frank-runner/data`. Using the same database file between the Frank!Runner and docker-compose prevents errors surrounding duplicate identifiers while running tests against OpenZaak. If you don't have the Frank!Runner installed, you can use `./data` that is commented out instead.

## docker-compose.zaakbrug.staging.dev
Contains an instance of OpenZaak specifically configured to act as cache or staging for ZGW to ZDS translations. It shares a network with ZaakBrug, and should be considered a component of the ZaakBrug deployment for when ZGW to ZDS translations are required.

The ZaakBrug "staging" OpenZaak admin console can be accessed from `host.docker.internal:9000/zaakbrug/staging/`  
The ZaakBrug "staging" OpenZaak is not exposed.

#### Configuration
When running OpenZaak for the first time or after the database data has been lost, it is necessary to configure an application in the OpenZaak admin gui with the correct JWT client_id and secret at `API Authorisaties -> Applicaties -> Applicatie toevoegen +`. For development, the default credentials can be found in `./src/main/resources/credentials.properties`. Makes sure to also click the `Heeft alle autorisaties` checkbox. The Label can be anything.

Next, a catalog needs to be imported and published. Go to `Gegevens -> Catalogi -> Importeer catalogus +`. Browse to `./e2e/OpenZaak/openzaak-export-catalogus-zaaktypes-updated.zip` in the ZaakBrug repository. Make sure `Generate new UUIDs` is checked and click `Importeer`. To publish the catalog, you need to publish the individual resources contained in the catalog. You can find `Toon Zaaktypen | Toon besluittypen | Toon Informatieobjecttypen` in the `Acties` column. Start by following the right-most link, select all items in the table, select the option `Publiceer de geselecteerde...` from the dropdown just above the table and click `uitvoeren`. Repeat this for the other two links.

## docker-compose.openzaak.dev
Contains an instance of OpenZaak for testing ZDS to ZGW translations.

OpenZaak Admin console can be accessed from `host.docker.internal:9000/openzaak/`  
OpenZaak is also exposed on `host.docker.internal:9001/`

#### Configuration
When running OpenZaak for the first time or after the database data has been lost, it is necessary to configure an application in the OpenZaak admin gui with the correct JWT client_id and secret at `API Authorisaties -> Applicaties -> Applicatie toevoegen +`. For development, the default credentials can be found in `./src/main/resources/credentials.properties`. Makes sure to also click the `Heeft alle autorisaties` checkbox. The Label can be anything.

Next, a catalog needs to be imported and published. Go to `Gegevens -> Catalogi -> Importeer catalogus +`. Browse to `./e2e/OpenZaak/openzaak-export-catalogus-zaaktypes-updated.zip` in the ZaakBrug repository. Make sure `Generate new UUIDs` is checked and click `Importeer`. To publish the catalog, you need to publish the individual resources contained in the catalog. You can find `Toon Zaaktypen | Toon besluittypen | Toon Informatieobjecttypen` in the `Acties` column. Start by following the right-most link, select all items in the table, select the option `Publiceer de geselecteerde...` from the dropdown just above the table and click `uitvoeren`. Repeat this for the other two links.

## docker-compose.openforms.dev
TODO

Open Formulieren can be accessed from `host.docker.internal:9000/openforms/`  
Open Formulieren is also exposed on `host.docker.internal:9003/`

TODO

## docker-compose.sentry.dev
Contains a Sentry instance for monitoring applications in the environment. Particularly useful for troubleshooting OpenZaak, OpenForms, etc.

The Sentry GUI can be accessed at `host.docker.internal:9500` or `localhost:9500`.

#### Configuration
Running Sentry for the first time requires some configuration.

TODO: Automate configuration

1. Makes sure the `docker-compose.sentry.dev.yml` is included in your ` docker-compose up` and is running.
2. Open a CMD or Powershell in this repository folder and run `docker-compose -f ./docker-compose.sentry.dev.yml exec sentry sentry upgrade`.
3. After approx. a minute you will get asked if you want to create a user account. Choose `y` and hit enter.
4. We use the following defaults: email=`admin@wearefrank.nl`, password: `admin`.
5. Once finished, run the command: `docker-compose -f ./docker-compose.sentry.dev.yml restart sentry` to restart the sentry container.
6. Open a browser and navigate to `host.docker.internal:9500` or `localhost:9500`. You should see the Sentry login page. Login we the email and password from step 4.
7. Make sure the root url is `http://host.docker.internal:9500` and choose `Please keep my usage information anonymous` under Usage Statistics.
8. In the top-right corner hit the `add...` button and choose `project`.
9. Select the appropriate platform. For OpenZaak, ZaakBrug-Staging and OpenForms this will be `Django`. Change the project name appropriately and hit the `Create Project` button.
10. On the next page look for the word `dsn` and copy the value.
11. In the appropriate docker-compose file, add the following to the environment variables of the `open-zaak`, `zaakbrug-staging` and/or `open-forms` service:
```
- SENTRY_DSN=<Your copied DSN from step 10>
- SDK_SENTRY_DSN=<Your copied DSN from step 10>
```
12. Repeat step 8 - 11 for each application you want to monitor.
