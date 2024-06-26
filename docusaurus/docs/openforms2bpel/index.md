---
sidebar_position: 20
---

# Openform2bpel

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