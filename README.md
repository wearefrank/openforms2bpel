# Openforms2bpel

An integration connecting [Open-forms](https://github.com/open-formulieren/open-forms) as forms application to the Exxellence "bpel-basic" back-end and various services around. The integration can be configured to host an "Objects API" endpoint that can be configured in Open-forms as "Objects API" registration back-end. Alternatively the integration can be configured to retrieve the object from an "Objects API" when triggered by a notification from the "Notificatie API".

This integration leverages [Frank!Framework](https://github.com/frankframework/frankframework) and its debugger [Ladybug](https://github.com/wearefrank/ladybug). Ladybug shows for each incoming request the exact steps that were executed to process the message in great detail. If there are errors, this information can be used for easy debugging.

Features:
- Objects API endpoint to configure as registration back-end in Open-forms.
- Notificatie API callback endpoint to retrieve the object given in the notification.
- Filter notifications based on configurable "producttype".
- Register Notificatie API callback endpoint with Notificatie API (subscribe).
- Register case with bpel-basic service.
- Support for person with DigiD or without DigiD.
- Support for organisation with E-Herkenning or without E-Herkenning.
- Provide payment details and set payment status to completed with the "payment-service"
- Add Open-forms form result pdf to the case.
- Retrieve form attachments from Documenten API, add document metadata to the case with the Exxellence "document-service", upload the filedata to the document vault with the "mtom-service" and mark the document as uploaded to the vault with the "BasicStatusUpdate-service".
- Translate JSON formdata to XML and add it to the case.
- Automatically prepend JSON key-names that result in llegal element names in XML.
- Can be configured as "ZGW API" registration back-end without access to any formdata (limited implementation).

# System
### Option 1: Notification API - object created notification
![ZGW API's](./docs/openforms2bpel-system-notification-api.drawio.svg)
### Option 2: Objects API objects_create endpoint as registration backend
![ZGW API's](./docs/openforms2bpel-system-objects-api.drawio.svg)
### Option 3: ZGW API's as registration backend (Partially implemented)
![ZGW API's](./docs/openforms2bpel-system-zgw-apis.drawio.svg)

# Usage

### Running with Docker
Ensure that Docker is installed on your computer and proceed as follows:

1. Clone GitHub project https://github.com/wearefrank/openforms2bpel if you have not done so yet.
1. Open a command prompt and change directory to the checkout directory.
1. Build your Docker image from the source code using a command like the following: `docker build -t openforms2bpel:local .`.
1. Run Openforms2bpel using a command like the following: `docker run -p 8080:8080 -e dtap.stage=LOC --name=openforms2bpel openforms2bpel:local`.
1. To see the Openforms2bpel integration running in the Frank!Console, open a webbrowser and visit http://localhost:8080.

