![zaakbrug-banner-small.png](/docs/picturesReadme/zaakbrug-banner-small.png)

Successor of [Open-ZaakBrug](https://sudwest-fryslan.github.io/OpenZaakBrug), an app for Dutch municipalities that supports the transition from "zaak- en documentatieservices" (zds) to "zaakgericht werken" (zgw).

Dutch municipalities provide services that are delivered many times. An example of such a service is to provide passports. This service is delivered many times because each citizen needs a passport or an ID card. An instance of a service that is provided multiple times is referred by the Dutch word "zaak" (case).

There is a new specification named "zaakgericht werken" (zgw) for case register systems. Zgw is part of the [Common Ground specification](https://vng.nl/artikelen/common-ground) for software used by Dutch municipalities. Zgw will replace an old specification called "zaak- en documentatieservices" (zds). The municipality of Súdwest Fryslân wants to migrate to the zgw standard without having to invest in zds interfaces. To this end, the municipality has built the system Open-ZaakBrug (brug means bridge). It acts as an interface between a zgw case register system on the one hand and zds systems connecting to the case register system on the other hand. The Open-ZaakBrug source code is hosted on [GitHub Sudwest-Fryslan/OpenZaakBrug](https://github.com/Sudwest-Fryslan/OpenZaakBrug). For a comparison of zgw and zds see [API-standaarden voor Zaakgericht Werken vergeleken met de Zaak- en Documentservices](https://vng.nl/sites/default/files/2022-03/20200703%20-%20Vergelijking%20ZGW%20APIs%20en%20ZDS_v1.0.pdf#:~:text=De%20Zaak-%20en%20Documentservices%20%28ZDS%29-standaard%20beschrijft%20hoe%20een,vakapplicatie%20en%20deze%20worden%20gekopieerd%20naar%20het%20zaaksysteem).

This project, ZaakBrug, is meant to be a successor of Open-ZaakBrug. It leverages the [Frank!Framework](https://wearefrank.nl/en/framework) and its debugger Ladybug. The debugger shows for each incoming request which steps are executed to process the message. If there are errors, this information can be used for easy debugging. ZaakBrug does not only connect zds systems with case register system [OpenZaak](https://openzaak.org/en), but with any case register system that implements zgw.

# Starting ZaakBrug

### Development in Visual Studio Code

When you are doing development work on ZaakBrug, you may want to boot it using WeAreFrank!'s Frank!Runner. When you use the Frank!Runner, you can boot ZaakBrug from within your Integrated Development Environment (IDE); we support the two IDEs Visual Studio Code and Eclipse.

To boot ZaakBrug using the Frank!Runner, you need version control system Git. Choose or create some empty directory in which you can clone Git repositories. For the sake of the argument, we assume it to be `work`. Please do the following:

1. Open a command prompt and change directory to `work`.
1. Clone the Frank!Runner: `git clone https://github.com/ibissource/frank-runner`.
1. Clone ZaakBrug: `git clone https://github.com/ibissource/zaakbrug`.
1. Start the Frank!Runner with one of the boot scripts in the Frank!Runner checkout directory: `start.bat` or `restart.bat` for Windows or `start.sh` or `restart.sh` for Linux or Mac. This step lets the Frank!Runner download Ant, a build tool for Java applications.
1. Configure your IDE as described in the Frank!Runner's documentation, see https://github.com/ibissource/frank-runner. For VS Code, these instructions let you install the Task Explorer plugin by Scott Meesseman.
1. If your IDE is Visual Studio Code, you should have a link to open ZaakBrug, see number 2 in the figure below. Use the menu option number 1 to get access to the link. Click the link to open ZaakBrug using the Frank!Runner.

   ![antJobVsCode.jpg](/docs/picturesReadme/antJobVsCode.jpg)

### Running with Docker

In a production environment it is recommended to run ZaakBrug with Docker. Ensure that Docker is installed on your computer and proceed as follows:

1. Clone GitHub project https://github.com/ibissource/zaakbrug if you have not done so yet.
1. Open a command prompt and change directory to the checkout directory.
1. Build your Docker image from the source code using a command like the following: `docker build -t zaakbrug:test .`.
1. Run ZaakBrug using a command like the following: `docker run -p 8080:8080 -e dtap.stage=LOC --name=zaakbrug zaakbrug:test`.
1. To see the user interface of ZaakBrug, open a webbrowser and visit http://localhost:8080.
1. ZaakBrug provides an automated health check. You can run it with the following command: `docker inspect --format='{{json .State.Health.Status}}' zaakbrug`.

   > **Warning:** In a DOS command window under Windows, the string after `--format=` has to be enclosed between `""`. You have `docker inspect --format="{{json .State.Health.Status}}" zaakbrug`.
   
   > **Info:** If you know the Frank!Framework, the following information may be helpful. If the health check produces the value `healthy`, it is guarenteed that all adapters in the Frank configuration have booted without errors.

# Configuration
## Zaak- and Documentidentificatie
The properties `zaakbrug.zgw.zaak-identificatie-template` and `zaakbrug.zgw.document-identificatie-template` can be configured to specify how the zaak- and documentidentificatie should be generated and formatted.
The syntax for variable substitution is as follows {[variable-name][:formatting-string]} 
| Variable | Description |
| --- | --------- |
| id | Auto-incrementing identifier with 'D' as formatting option, indicating the amount of digits. <br/>_Example:_ `{id:D5}` with id-123 will result in '00123'. |
| datetime | The current date and time with '[Y]' as formatting option, according to [XSLT datetime formatting](https://www.oreilly.com/library/view/xslt-2nd-edition/9780596527211/ch04s05.html). <br/> _Examples:_ <ul><li>`{datetime:[Y]}` with datetime=14-03-2023 produces '2023'</li><li>`{datetime:[Y0001]}` with datetime=14-03-2023 produces '2023'</li><li>`{datetime:[Y][M][D]}` with datetime=14-03-2023 produces '2023314'</li><li>`{datetime:[Y0001][M01][D01]}` with datetime=14-03-2023 produces '20230314'</li><li>`{datetime:[Y][M01][D]}` with datetime=14-03-2023 produces '20230314'</li></ul>
