[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

## [1.20.14](https://github.com/wearefrank/openforms2bpel/compare/v1.20.13...v1.20.14) (2024-06-17)

### 🐛 Bug Fixes

* updatePayment createAddPaymentState xslt can grab multiple paymentId's unintentionally ([ef681b5](https://github.com/wearefrank/openforms2bpel/commit/ef681b51754a23b7d51772583f72cd173f99420e))
* updatePayment payment lookup fails during retry due to already changed reference to orderId ([94f27e6](https://github.com/wearefrank/openforms2bpel/commit/94f27e63fc8b99237076ec0902d075471001d916))

### ✅ Tests

* expand lookupPayment mock with scenario where lookup with caseReference returns no payments but a following lookup with orderId yields result ([735027c](https://github.com/wearefrank/openforms2bpel/commit/735027c9a673d352ce063b5e3f7b6a64d6c38294))

## [1.20.13](https://github.com/wearefrank/openforms2bpel/compare/v1.20.12...v1.20.13) (2024-06-11)

### 🧑‍💻 Code Refactoring

* exlusively use person bsn from uw-gegevens section instead of bsn outside formdata ([520e8bd](https://github.com/wearefrank/openforms2bpel/commit/520e8bd32054a80b2f496d7e345135f28433a394))

## [1.20.12](https://github.com/wearefrank/openforms2bpel/compare/v1.20.11...v1.20.12) (2024-06-07)

### 🧑‍💻 Code Refactoring

* store and use document upload state in database ([1d454b6](https://github.com/wearefrank/openforms2bpel/commit/1d454b65bcfc8351093efde75e74ad2ce5e14e0a))

## [1.20.11](https://github.com/wearefrank/openforms2bpel/compare/v1.20.10...v1.20.11) (2024-06-06)

### 🔁 Continuous Integration

* add correct permission scopes for docusaurus deployment ([4f7e7a2](https://github.com/wearefrank/openforms2bpel/commit/4f7e7a2d165366e943481d7a9e6ff084d83bc2ea))

## [1.20.10](https://github.com/wearefrank/openforms2bpel/compare/v1.20.9...v1.20.10) (2024-06-06)

### 🔁 Continuous Integration

* add docusaurus deployment to release workflow ([e84b551](https://github.com/wearefrank/openforms2bpel/commit/e84b551aac3ab970dcfe679d4f8d6ab080cd03c7))

## [1.20.9](https://github.com/wearefrank/openforms2bpel/compare/v1.20.8...v1.20.9) (2024-06-06)

### 🧑‍💻 Code Refactoring

* add docusaurus GitHub pages for documentation ([#51](https://github.com/wearefrank/openforms2bpel/issues/51)) ([e537ab2](https://github.com/wearefrank/openforms2bpel/commit/e537ab20f2eaa012150d9b66f5c97090efd8014f))

## [1.20.8](https://github.com/wearefrank/openforms2bpel/compare/v1.20.7...v1.20.8) (2024-06-03)

### 🔁 Continuous Integration

* remove conventional-commits preset version lock ([ff2dd63](https://github.com/wearefrank/openforms2bpel/commit/ff2dd6377efb556fac4b793eea3904f69ce3cf81))

## [1.20.7](https://github.com/wearefrank/openforms2bpel/compare/v1.20.6...v1.20.7) (2024-05-31)


### 🐛 Bug Fixes

* no-reply email does not contain any newline characters ([883ab23](https://github.com/wearefrank/openforms2bpel/commit/883ab23420fbb0eda44f1079271b1d6021c5faaf))


### ✅ Tests

* **docker-compose:** expose mailslurper webgui so that formatting of emails can be viewed ([01f96bb](https://github.com/wearefrank/openforms2bpel/commit/01f96bbdddfef4c3ab42bcd3bfb942840fd982ec))

## [1.20.6](https://github.com/wearefrank/openforms2bpel/compare/v1.20.5...v1.20.6) (2024-05-30)


### 🐛 Bug Fixes

* alpha3b languages codes are not translated to alpha2 while alpha3t language codes do ([9e84be7](https://github.com/wearefrank/openforms2bpel/commit/9e84be7ced0fe0a6638ad85491e1d6fe75281d69))


### ✅ Tests

* **larva:** add GetISO639Code xslt testcases for all variants of language code conversion ([bf64f93](https://github.com/wearefrank/openforms2bpel/commit/bf64f937f60c3b2f72d311e00f0986417dbf1eeb))
* add testcase for documents with an alpha3b language code ([58d6892](https://github.com/wearefrank/openforms2bpel/commit/58d68925fe89480b7e0796dffed0a27c28aa34c9))

## [1.20.5](https://github.com/wearefrank/openforms2bpel/compare/v1.20.4...v1.20.5) (2024-05-29)


### 🐛 Bug Fixes

* document status update document description is incorrectly copied ([9e7a969](https://github.com/wearefrank/openforms2bpel/commit/9e7a96937f392cc3428d69f2a288598c8635d7f1))

## [1.20.4](https://github.com/wearefrank/openforms2bpel/compare/v1.20.3...v1.20.4) (2024-05-29)


### 🐛 Bug Fixes

* document status update incorrectly copies documentType element ([50a23d4](https://github.com/wearefrank/openforms2bpel/commit/50a23d49110882ccac2383768eaa6a44abd9845b))

## [1.20.3](https://github.com/wearefrank/openforms2bpel/compare/v1.20.2...v1.20.3) (2024-05-28)


### 🐛 Bug Fixes

* document status update request contains referenceNumber multiple times ([634f7f9](https://github.com/wearefrank/openforms2bpel/commit/634f7f98764f0cf5fc295edfc4b3b54c39693281))

## [1.20.2](https://github.com/wearefrank/openforms2bpel/compare/v1.20.1...v1.20.2) (2024-05-28)


### 🐛 Bug Fixes

* document status update request contains referenceNumber multiple times ([b9b2cf4](https://github.com/wearefrank/openforms2bpel/commit/b9b2cf41cbb39b0708af2f113c429b159f05b2f6))

## [1.20.1](https://github.com/wearefrank/openforms2bpel/compare/v1.20.0...v1.20.1) (2024-05-27)


### 🐛 Bug Fixes

* check if document already exists before trying to add a document to allow for retries ([c2836d2](https://github.com/wearefrank/openforms2bpel/commit/c2836d23e4a01b847a15c03a37fffc26e547c2d2))
* upload documents in parallel so that all document will always be tried ([bf51323](https://github.com/wearefrank/openforms2bpel/commit/bf51323144ca162a97f021ec5905e41587406b67))


### 🧑‍💻 Code Refactoring

* Combine seperate document-service sender adapter into a single adapter ([c052910](https://github.com/wearefrank/openforms2bpel/commit/c05291089bd4db9b7b96df5eec1728ab84fcbada))


### ✅ Tests

* add mock service for document-service and mtom-service ([15c96de](https://github.com/wearefrank/openforms2bpel/commit/15c96de256d2e4376a6febcc876e0a39f76da8a2))
* use soapui mock instead of mock adapter for document-service ([e8f2111](https://github.com/wearefrank/openforms2bpel/commit/e8f2111df0edaff50aae5a3e0007455bdf5ad4c2))

## [1.20.0](https://github.com/wearefrank/openforms2bpel/compare/v1.19.0...v1.20.0) (2024-05-24)


### 🍕 Features

* include 'extraVars' section from Objects API object in formdata ([082a7e0](https://github.com/wearefrank/openforms2bpel/commit/082a7e0d9a492974fb97b527c94c446391bcdebd))
* transform formdata element names containing '-' to camel-case ([ddefcfe](https://github.com/wearefrank/openforms2bpel/commit/ddefcfedb0aa806cc43d4beddbc19307a781d7f9))


### 🧑‍💻 Code Refactoring

* configurable xslt's for collecting and tranforming formdata ([f8ebfdc](https://github.com/wearefrank/openforms2bpel/commit/f8ebfdc89b3828d46bcdffb27952db4e94631803))


### ✅ Tests

* add larva test for custom formdata collector with 'extraVars' section ([fabf317](https://github.com/wearefrank/openforms2bpel/commit/fabf31707973dd991bcbc4cdcb2ca54508927f6b))
* add larva test for custom formdata tranform containing 'form' element injection and '-' to camel-case ([ececc52](https://github.com/wearefrank/openforms2bpel/commit/ececc52f1f39c53db000d1ac7bcbaea1e409a064))
* add override docker-compose for Utrecht specific tranformations ([95d10e2](https://github.com/wearefrank/openforms2bpel/commit/95d10e26b0d2feaf7b96fda4a17ab3439e963ec5))
* add testcase for checking if extraVars section is included in the formdata ([696eb51](https://github.com/wearefrank/openforms2bpel/commit/696eb5140d0df678ff78f766541c4107029ed471))
* larva tests for default formdata collector and default formdata tranform ([bf0e291](https://github.com/wearefrank/openforms2bpel/commit/bf0e291f02f9b41779c0ecbd739ab2b1cfe68d8c))

## [1.19.0](https://github.com/wearefrank/openforms2bpel/compare/v1.18.2...v1.19.0) (2024-05-16)


### 🍕 Features

* send no-reply email to user on unresolvable functional errors ([0e76805](https://github.com/wearefrank/openforms2bpel/commit/0e76805d0cfb65f7231f9f67bdd4ae90b9ba877d))


### 🐛 Bug Fixes

* retries are incorrectly triggered due to deadlocked transactions ([8aad17e](https://github.com/wearefrank/openforms2bpel/commit/8aad17eedc4f9aa9750c4560df659fb8e5c7f7ed))
* unable to see webservicesender response when response is a soapfault ([7f8337d](https://github.com/wearefrank/openforms2bpel/commit/7f8337dc28d86c265b2480b71ecf0f211839836c))


### ✅ Tests

* add test-environment docker-compose with mailslurper smtp testserver ([380d3a5](https://github.com/wearefrank/openforms2bpel/commit/380d3a542bb1a9fd4af958a9b18532bc9dad0e76))

## [1.18.2](https://github.com/wearefrank/openforms2bpel/compare/v1.18.1...v1.18.2) (2024-05-15)


### 🐛 Bug Fixes

* incorrect provider is passed to addDocumentsToCaseHandler when no auth is used and no bsn or kvknummer is provided ([73176c9](https://github.com/wearefrank/openforms2bpel/commit/73176c9f2ba844dfaa5c33ace5f57fb4c046c2bc))


### ✅ Tests

* add testcase for no auth and no bsn or kvknr ([a78d71a](https://github.com/wearefrank/openforms2bpel/commit/a78d71af101559ac36243a9dfe659818156cb4a7))

## [1.18.1](https://github.com/wearefrank/openforms2bpel/compare/v1.18.0...v1.18.1) (2024-05-07)


### 🐛 Bug Fixes

* continue without error when an organization is not found in gegmag ([e69e9af](https://github.com/wearefrank/openforms2bpel/commit/e69e9af8a6f2eb3ec18154871c6a5976662c225c))


### 🔁 Continuous Integration

* lock conventionalcommit preset version to major 7 due to breaking change ([e1409a6](https://github.com/wearefrank/openforms2bpel/commit/e1409a607b54ae2e07c54a0036d1a354a079f6e6))
* lock conventionalcommit preset version to major 7 due to breaking change ([baf9213](https://github.com/wearefrank/openforms2bpel/commit/baf9213924e9f51948228240744e2ff98dfaeabc))

## [1.18.0](https://github.com/wearefrank/openforms2bpel/compare/v1.17.5...v1.18.0) (2024-05-03)


### 🍕 Features

* add a person to gegmag when the person is not present in gegmag ([8f44619](https://github.com/wearefrank/openforms2bpel/commit/8f44619b6ad47f75fa319ce0af0eeab3db62a5fa))


### 🐛 Bug Fixes

* pick first telnr in uw-gegevens to initiatingsubject translation to prevent error when multiple telnrs are given in uw-gegevens ([7cfe966](https://github.com/wearefrank/openforms2bpel/commit/7cfe966eea5f7d44a88d68b9253afbdb8156aeae))


### 🧑‍💻 Code Refactoring

* errors from bpel service calls are caught on the spot for better error feedback ([cee241a](https://github.com/wearefrank/openforms2bpel/commit/cee241aadc06adaa796f694ea156b0d9630f4f2b))


### ✅ Tests

* testcase for adding a person to gegmag when the person is not present in gegmag ([b345108](https://github.com/wearefrank/openforms2bpel/commit/b345108b586b475d6b7f2cc6c2576d0099823d78))
* transactionality and error handling testcase for unavailable cases service endpoint ([0d453ba](https://github.com/wearefrank/openforms2bpel/commit/0d453ba0605f9b52abd4c6a1195d58e003896596))

## [1.17.5](https://github.com/wearefrank/openforms2bpel/compare/v1.17.4...v1.17.5) (2024-05-02)


### 🧑‍💻 Code Refactoring

* set lookupperson source to dont_care instead of internal ([093ddb3](https://github.com/wearefrank/openforms2bpel/commit/093ddb383a17de077b1a0a4a565ad940b9a5bc93))

## [1.17.4](https://github.com/wearefrank/openforms2bpel/compare/v1.17.3...v1.17.4) (2024-05-02)


### 🐛 Bug Fixes

* check if form initiatingsubject is the same as the case initiatingsubject in tweewegcommunicatie workflow ([c5f5699](https://github.com/wearefrank/openforms2bpel/commit/c5f56990183509b33f11dabbf04f59dd772b204c))

## [1.17.3](https://github.com/wearefrank/openforms2bpel/compare/v1.17.2...v1.17.3) (2024-05-02)


### 🐛 Bug Fixes

* throw error when initiatingsubject is not found in gegmag so that it can be retried ([50c9c1d](https://github.com/wearefrank/openforms2bpel/commit/50c9c1d587a60ee19fc2b092ec307328305fbda0))
* tweecommunicatie flagged as duplicate due casereference as messageid ([08a9421](https://github.com/wearefrank/openforms2bpel/commit/08a942132dbefeef58e883acbf36b81a06d10ac7))

## [1.17.2](https://github.com/wearefrank/openforms2bpel/compare/v1.17.1...v1.17.2) (2024-05-01)


### 🐛 Bug Fixes

* no transaction when resending message from errorstore ([8420a21](https://github.com/wearefrank/openforms2bpel/commit/8420a212397528f9779c151f75b7012da9c5c1a1))

## [1.17.1](https://github.com/wearefrank/openforms2bpel/compare/v1.17.0...v1.17.1) (2024-04-30)


### 🐛 Bug Fixes

* update initiatingsubject email and telnr in gegmag instead of cases proxy ([b63169f](https://github.com/wearefrank/openforms2bpel/commit/b63169f53331f049591aa1fc6db5aafa232dbc6d))

## [1.17.0](https://github.com/wearefrank/openforms2bpel/compare/v1.16.11...v1.17.0) (2024-04-30)


### 🍕 Features

* add form result pdf to existing case in twowaycommunication workflow ([482d9c1](https://github.com/wearefrank/openforms2bpel/commit/482d9c17ac5b95b6b657298308e1f5786ede4455))

## [1.16.11](https://github.com/wearefrank/openforms2bpel/compare/v1.16.10...v1.16.11) (2024-04-26)


### 🐛 Bug Fixes

* update initiatingsubject hisstartdate nil ([136073a](https://github.com/wearefrank/openforms2bpel/commit/136073a6ec5f704afbd31af0eb9b49485ee9aba2))

## [1.16.10](https://github.com/wearefrank/openforms2bpel/compare/v1.16.9...v1.16.10) (2024-04-25)


### 🐛 Bug Fixes

* update initiatingsubject with id nil ([f3fd28c](https://github.com/wearefrank/openforms2bpel/commit/f3fd28c3040140e0421a13c27969326dcbc1018c))

## [1.16.9](https://github.com/wearefrank/openforms2bpel/compare/v1.16.8...v1.16.9) (2024-04-25)


### 🐛 Bug Fixes

* update initiatingsubject with enddate ([0f6491a](https://github.com/wearefrank/openforms2bpel/commit/0f6491ad6029ee552a9d0f87eb5396adf0c29374))

## [1.16.8](https://github.com/wearefrank/openforms2bpel/compare/v1.16.7...v1.16.8) (2024-04-23)


### 🐛 Bug Fixes

* replace updatedetailedcase message with seperate updatepersons and updateorganizations messages ([d92f8f9](https://github.com/wearefrank/openforms2bpel/commit/d92f8f92c12728ad61689e8f4461055738b8493e))


### ✅ Tests

* add updatePersons and updateOrganization to cases proxy mock ([2b1d6d5](https://github.com/wearefrank/openforms2bpel/commit/2b1d6d583316465e0b4baeed5e679e5aa4ab4b7c))

## [1.16.7](https://github.com/wearefrank/openforms2bpel/compare/v1.16.6...v1.16.7) (2024-04-23)


### 🐛 Bug Fixes

* missing caseType when updating initiatorsubject ([73a4ca3](https://github.com/wearefrank/openforms2bpel/commit/73a4ca31a018390b05bd28d04c4e91b39b1c2114))
* remove brackets and quotes from payment orderid ([e66e6a4](https://github.com/wearefrank/openforms2bpel/commit/e66e6a4ab75f727aaf27c1847a8a9c900119b2a3))
* updating initiatingsubject fails on invalid data according to schema ([0090572](https://github.com/wearefrank/openforms2bpel/commit/0090572adbfcb41399227450dad2380945fe0720))


### ✅ Tests

* fill readcases mock with schema compliant data ([73e2c72](https://github.com/wearefrank/openforms2bpel/commit/73e2c728daa2bb0a6aa8b7e8caf589678e670015))
* update payment testcase to have public order id with brackets ([3eeb85e](https://github.com/wearefrank/openforms2bpel/commit/3eeb85e5a5b37a9282f22109d238af2e8602f047))

## [1.16.6](https://github.com/wearefrank/openforms2bpel/compare/v1.16.5...v1.16.6) (2024-04-19)


### 🐛 Bug Fixes

* casetype wrongfully included om updatedetailedcaserequest ([8ad6dfc](https://github.com/wearefrank/openforms2bpel/commit/8ad6dfcbc0cdc99ca79228323fe375e0d4a6d8a5))
* payment orderId incorrectly includes square brackets and single quotes ([0fda936](https://github.com/wearefrank/openforms2bpel/commit/0fda936a6a15b41e326f6ae9f14f5574c6d714fd))
* updatedetailedcaserequest missing verwerkingsoort when attribute is not present in readcases response ([b524ce0](https://github.com/wearefrank/openforms2bpel/commit/b524ce06db5c33669fbf4c918adcf0147e360536))
* updatepaymentrequest incorrectly also set the description field under extSystem ([f250825](https://github.com/wearefrank/openforms2bpel/commit/f250825e914c155e33138e3491625c5773bf78c3))

## [1.16.5](https://github.com/wearefrank/openforms2bpel/compare/v1.16.4...v1.16.5) (2024-04-18)


### 🐛 Bug Fixes

* date of payment missing with newer forms ([f7b47ef](https://github.com/wearefrank/openforms2bpel/commit/f7b47ef0141c2e4903974e6159278352649ba317))
* document nil=true instead of nil='true' ([c474113](https://github.com/wearefrank/openforms2bpel/commit/c474113786170e68fc2261a0528a3ee90541185e))
* soap faults are being ignored in calls to bpel services ([c2df2c0](https://github.com/wearefrank/openforms2bpel/commit/c2df2c0fbd6860c6b63a9b5158e7747ee2a2ab43))
* update payment referencenumber with openforms orderid ([ba0186c](https://github.com/wearefrank/openforms2bpel/commit/ba0186cb3aeb0bb111d4427c7c55760eba872326))
* updating initiatingsubject invalid element primaryOrganization ([71af410](https://github.com/wearefrank/openforms2bpel/commit/71af4108b00691a1438a8563d7b9b778076b1bdd))


### 🧑‍💻 Code Refactoring

* consolidate specific payment service webservicesender adapter to single adapter ([2176fff](https://github.com/wearefrank/openforms2bpel/commit/2176fff43c7550c928ffe731797c20c15647db12))
* remove obsolete methodtype post attribute on webservicesenders ([10dffb3](https://github.com/wearefrank/openforms2bpel/commit/10dffb3c305218b5b3842512258d592515a4b091))

## [1.16.4](https://github.com/wearefrank/openforms2bpel/compare/v1.16.3...v1.16.4) (2024-04-18)


### 🐛 Bug Fixes

* document provider invalid when form is sent anonymously ([1b3f47b](https://github.com/wearefrank/openforms2bpel/commit/1b3f47b600bfd79c39c14e7cf788c9044ca18e5a))


### ✅ Tests

* anonymous form testcase added ([31f3a89](https://github.com/wearefrank/openforms2bpel/commit/31f3a89a3c749382fbef7c65ea2d0912607b6b8f))

## [1.16.3](https://github.com/wearefrank/openforms2bpel/compare/v1.16.2...v1.16.3) (2024-04-17)


### 🐛 Bug Fixes

* updating iniatingsubject email & tel fails due to missing required fields ([0bba80d](https://github.com/wearefrank/openforms2bpel/commit/0bba80d81d1322e9d7d4b5cc7f7f47ac37f4d2bb))


### ✅ Tests

* configure transactionmanager and xa postgres driver in development docker-compose ([18601aa](https://github.com/wearefrank/openforms2bpel/commit/18601aaa52d4664be37e0f87059937fb878ccf60))


### 🤖 Build System

* **dependencies:** bump f!f version to 8.1.0-RC2-20240411.160355 ([34a66a4](https://github.com/wearefrank/openforms2bpel/commit/34a66a48303e7de5634187a7d75169392e14107f))

## [1.16.2](https://github.com/wearefrank/openforms2bpel/compare/v1.16.1...v1.16.2) (2024-04-11)


### 🐛 Bug Fixes

* missing referenceNumber when updating iniatingSubject email and tel ([7b524f0](https://github.com/wearefrank/openforms2bpel/commit/7b524f09305780c1423af583a4fd78d605807320))

## [1.16.1](https://github.com/wearefrank/openforms2bpel/compare/v1.16.0...v1.16.1) (2024-04-11)


### 🐛 Bug Fixes

* cases-service soapactions missing cases namespace prefix ([99b3308](https://github.com/wearefrank/openforms2bpel/commit/99b3308a2d1feddacf6d711bfda7564cafb630d5))

## [1.16.0](https://github.com/wearefrank/openforms2bpel/compare/v1.15.2...v1.16.0) (2024-04-10)


### 🍕 Features

* update initiatingsubject email and phone number in gegevens magazijn ([2d8ec2a](https://github.com/wearefrank/openforms2bpel/commit/2d8ec2a57349f856d0102cd56b7ca2ec8eff7f77))


### ✅ Tests

* add mock service for cases proxy service ([a1e8a17](https://github.com/wearefrank/openforms2bpel/commit/a1e8a1756a653dfc9b95c72bdd2c60fa66588331))

## [1.15.2](https://github.com/wearefrank/openforms2bpel/compare/v1.15.1...v1.15.2) (2024-04-09)


### ✅ Tests

* larva unit-tests for FilterUwGegevensSection.xslt ([6884466](https://github.com/wearefrank/openforms2bpel/commit/6884466e231746e0982e748cca31e25d956393c5))

## [1.15.1](https://github.com/wearefrank/openforms2bpel/compare/v1.15.0...v1.15.1) (2024-04-09)


### 🐛 Bug Fixes

* errors during translations when multiple uw-gegevens subsections are present ([f2db81f](https://github.com/wearefrank/openforms2bpel/commit/f2db81f275b23edbbdbd5013808156cc91c53105))
* errorstore is eating errors without storing the message in the errorstore ([4b59c7b](https://github.com/wearefrank/openforms2bpel/commit/4b59c7b369005b844548a629071bc787f9373c65))


### ✅ Tests

* add testcase where all uw-gegevens sections are present ([d9769d7](https://github.com/wearefrank/openforms2bpel/commit/d9769d782c40a88a30558ec7481c319ceabedf37))

## [1.15.0](https://github.com/wearefrank/openforms2bpel/compare/v1.14.11...v1.15.0) (2024-03-20)


### 🍕 Features

* support forms for uploading additional documents to an existing case ([ffa80cd](https://github.com/wearefrank/openforms2bpel/commit/ffa80cd30754cab2b5059b14dda48f2311bcfb79))


### ✅ Tests

* add two-way communication form testcase ([ee7913c](https://github.com/wearefrank/openforms2bpel/commit/ee7913cff63dfe40b94e07229750ec7927e56a44))
* mount configurations folder to frank container to allow frank!console configuration reloads in development docker-compose ([86643fa](https://github.com/wearefrank/openforms2bpel/commit/86643fae47017377c55820fbf879e4b7a0d35efb))

## [1.14.11](https://github.com/wearefrank/openforms2bpel/compare/v1.14.10...v1.14.11) (2024-03-05)


### 🐛 Bug Fixes

* nested invalid xml elements names are not being replaced in the input json ([85a761a](https://github.com/wearefrank/openforms2bpel/commit/85a761a8a6c37bdab8cfc0f42c72988293c7774c))

## [1.14.10](https://github.com/wearefrank/openforms2bpel/compare/v1.14.9...v1.14.10) (2024-03-04)


### 🤖 Build System

* decouple from zaakbrug by using frank!framework as base image instead of zaakbrug ([ddd5d3a](https://github.com/wearefrank/openforms2bpel/commit/ddd5d3a088e19d34edc62c1834974ebf03db9b2e))

## [1.14.9](https://github.com/wearefrank/openforms2bpel/compare/v1.14.8...v1.14.9) (2024-02-26)


### 🔁 Continuous Integration

* include buildinfo.properties commit assets on release ([b190fca](https://github.com/wearefrank/openforms2bpel/commit/b190fcac04c6012ab67c6067437a6311d2d87750))
* update deprecated version export command with the new github way ([c7985d5](https://github.com/wearefrank/openforms2bpel/commit/c7985d5e3fe906b1a6119c9eb095987f9995f0b1))
* use release type for checking for new release ([5db861c](https://github.com/wearefrank/openforms2bpel/commit/5db861c4e9b994bc9536b9d2517a2c183b7eddad))

## [1.14.8](https://github.com/wearefrank/openforms2bpel/compare/v1.14.7...v1.14.8) (2024-02-26)


### 🔁 Continuous Integration

* abort cicd on push without a new release ([c7fa729](https://github.com/wearefrank/openforms2bpel/commit/c7fa729159e1278a3633617a5e04a2af8cc563ec))

## [1.14.7](https://github.com/wearefrank/openforms2bpel/compare/v1.14.6...v1.14.7) (2024-02-22)


### 🔁 Continuous Integration

* define github token permissions & disable sudo ([460a3f0](https://github.com/wearefrank/openforms2bpel/commit/460a3f0f62e595e3799889c8e0f6b77e1c805866))
* swap elevated github token with regular one ([848f215](https://github.com/wearefrank/openforms2bpel/commit/848f21538dedc5833d15cb8cbab38161b374e05a))
* switch to generic waf ci-cd-templates ([7ae3b0e](https://github.com/wearefrank/openforms2bpel/commit/7ae3b0ec172036746e6fbb96e0da755ba720add2))

## [1.14.6](https://github.com/wearefrank/openforms2bpel/compare/v1.14.5...v1.14.6) (2024-02-05)


### 🐛 Bug Fixes

* workaround for JSON keys being invalid XML element names ([453d4c2](https://github.com/wearefrank/openforms2bpel/commit/453d4c2f7014a7c111cadc14ab1e5625fcbc0d70))


### ✅ Tests

* testcase with different instances of invalid xml element names ([2f0bafa](https://github.com/wearefrank/openforms2bpel/commit/2f0bafa140430c600cbb0fbac0747e1ab533e5e1))


### 🤖 Build System

* update zaakbrug to v1.15.8 ([de23de4](https://github.com/wearefrank/openforms2bpel/commit/de23de4ec35e5d25cf5c4babf9bced067a4be81c))

## [1.14.5](https://github.com/wearefrank/openforms2bpel/compare/v1.14.4...v1.14.5) (2024-02-01)


### 🧑‍💻 Code Refactoring

* additional message to retrieve paymentId from reference ([f7f7d8d](https://github.com/wearefrank/openforms2bpel/commit/f7f7d8d48d4bbd15d0d0aef9d553a68d99389f66))


### ✅ Tests

* add payment mock ([35c4aa3](https://github.com/wearefrank/openforms2bpel/commit/35c4aa34afbfc5c18008ee2f943586015ffc2d89))

## [1.14.4](https://github.com/wearefrank/openforms2bpel/compare/v1.14.3...v1.14.4) (2024-01-29)


### 🐛 Bug Fixes

* updates payment status with addPaymentStatus ([ba2984c](https://github.com/wearefrank/openforms2bpel/commit/ba2984c70500da71261a29f34cf15939c846c37a))


### ✅ Tests

* add payment service mock ([fef529d](https://github.com/wearefrank/openforms2bpel/commit/fef529d3855df4de512a8ba2e472c6713e538d33))

## [1.14.3](https://github.com/wearefrank/openforms2bpel/compare/v1.14.2...v1.14.3) (2024-01-24)


### 🐛 Bug Fixes

* replace comma with dot in price ([c4acaf0](https://github.com/wearefrank/openforms2bpel/commit/c4acaf0735625cd7e59a58339caed16832e6151e))

## [1.14.2](https://github.com/wearefrank/openforms2bpel/compare/v1.14.1...v1.14.2) (2024-01-22)


### 🐛 Bug Fixes

* correct payment state values ([e83c7fc](https://github.com/wearefrank/openforms2bpel/commit/e83c7fc2e732c08fd46795de38901ff9cb40e301))

## [1.14.1](https://github.com/wearefrank/openforms2bpel/compare/v1.14.0...v1.14.1) (2024-01-22)


### 🐛 Bug Fixes

* always translate to correspondenceAdress instead of locationAdress and add POBox field ([6fbfe5c](https://github.com/wearefrank/openforms2bpel/commit/6fbfe5cec4f85396ded897ce2bf0b9184534feba))
* housenumber not translated as organisation ([eaaa2c2](https://github.com/wearefrank/openforms2bpel/commit/eaaa2c2b6f470baf2a951eb8a459efa28be33c0d))
* uw-gegevens section name variations not recognized ([2150c84](https://github.com/wearefrank/openforms2bpel/commit/2150c84706a1e37514c981647b7041f0d995f6db))
* voornamen not translated to person and email ([d752cbd](https://github.com/wearefrank/openforms2bpel/commit/d752cbd78ee619990463c6146f4bce082d1f775a))


### 🧑‍💻 Code Refactoring

* gender deducted from aanhef ([b195ae6](https://github.com/wearefrank/openforms2bpel/commit/b195ae6ac226542fd75c3c72dae9b8767232de74))

## [1.14.0](https://github.com/wearefrank/openforms2bpel/compare/v1.13.0...v1.14.0) (2024-01-19)


### 🍕 Features

* payment support ([2865573](https://github.com/wearefrank/openforms2bpel/commit/2865573852b6076a4373f8a4e9e25b83afe30e75))


### 🐛 Bug Fixes

* geboortedatum under persoongegevens missing in zaak ([666b857](https://github.com/wearefrank/openforms2bpel/commit/666b85735823042072e42baebd4d1ea452d661ce))
* voornamen under persoongegevens missing in zaak ([c271072](https://github.com/wearefrank/openforms2bpel/commit/c271072990f2ebc02b9c7004b4d9ed33dd020260))


### 🧑‍💻 Code Refactoring

* correct namespace naming to be in line with other messages ([f2c2126](https://github.com/wearefrank/openforms2bpel/commit/f2c21262225e247502642297ae4c7e5faca19ddb))


### ✅ Tests

* add testcase with payment ([65ccdff](https://github.com/wearefrank/openforms2bpel/commit/65ccdff426f5e83432f433219136aced79cf75ab))
* add testcase with payment ([f58b378](https://github.com/wearefrank/openforms2bpel/commit/f58b378b728e6eb98a1ba96f3235e4a43b6078cf))


### 🔁 Continuous Integration

* lock semantic-release to 22 major ([c8a3d55](https://github.com/wearefrank/openforms2bpel/commit/c8a3d559e9a0cc7eb44d18e82a33d89159ba08da))

## [1.13.0](https://github.com/wearefrank/openforms2bpel/compare/v1.12.0...v1.13.0) (2023-12-12)


### 🍕 Features

* expand Provider to include all different entities and auth methods for uploading documents ([c83a1db](https://github.com/wearefrank/openforms2bpel/commit/c83a1db1364356190858f492e9ec9dcaed1439c1))
* rewrite of InitiatingSubject to handle all different entities and auth methods ([683f723](https://github.com/wearefrank/openforms2bpel/commit/683f723e1d97fcebcc1f046f8efe9f68a3796de8))


### 🧑‍💻 Code Refactoring

* also initiate a zaak as an organisation ([2401c66](https://github.com/wearefrank/openforms2bpel/commit/2401c66571bba66bae7ac353d6a6573d89dfdffd))
* emailparameters to translate from uw-gegevenscompleet ignoring suffixes ([04c3cb1](https://github.com/wearefrank/openforms2bpel/commit/04c3cb1faeca4dde0483cbb233a353bc970a40b8))
* fill caseParameters clarification with user email ([3fc5fcd](https://github.com/wearefrank/openforms2bpel/commit/3fc5fcd29951a1c8a76cb7bb30280a4fdf804d49))


### ✅ Tests

* add testcases for all entities and auth methods ([b8c1d45](https://github.com/wearefrank/openforms2bpel/commit/b8c1d45e466dd5070f466b611f3b6ad7cac28a9c))

## [1.12.0](https://github.com/wearefrank/openforms2bpel/compare/v1.11.3...v1.12.0) (2023-12-07)


### 🍕 Features

* basicStatusUpdate implementation for signalling document upload status ([f5d6d45](https://github.com/wearefrank/openforms2bpel/commit/f5d6d458c8fe2b2dc782714c8ee82f40720dc8ac))


### 🐛 Bug Fixes

* addDocument fails when format property is too long ([0422e8e](https://github.com/wearefrank/openforms2bpel/commit/0422e8ee5bcffdd8786084e3638e20de20daba3a))
* form filled as person without digid fails due to wrong defaults ([33af55f](https://github.com/wearefrank/openforms2bpel/commit/33af55f951edf0a9453b3edf5a6f069f1deeef87))


### ✅ Tests

* add BasicStatusUpdate mock service ([e3ad58b](https://github.com/wearefrank/openforms2bpel/commit/e3ad58b403555477e10553c7189d9af26ef31f75))

## [1.11.3](https://github.com/wearefrank/openforms2bpel/compare/v1.11.2...v1.11.3) (2023-11-23)


### 🐛 Bug Fixes

* alpha2t language code not accepted by documents service ([56c2476](https://github.com/wearefrank/openforms2bpel/commit/56c2476a32099048acdf4ea1a4996779ecce8b2a))
* initiating subject tranlation not working when no digid used ([65e43a1](https://github.com/wearefrank/openforms2bpel/commit/65e43a136848d45e2c1396785d70af0c8c493cf1))
* mtom service soap action without namespace ([6a1132c](https://github.com/wearefrank/openforms2bpel/commit/6a1132cc9b3bc896c37179351559ccae3b256c01))


### ✅ Tests

* add enkelvoudiginformatieobject inhoud mock ([fafcea4](https://github.com/wearefrank/openforms2bpel/commit/fafcea43d2c74b29b5ec3133817956747855f0a8))

## [1.11.2](https://github.com/wearefrank/openforms2bpel/compare/v1.11.1...v1.11.2) (2023-11-22)


### 🐛 Bug Fixes

* documents service soap action document to documents ([fb01a2c](https://github.com/wearefrank/openforms2bpel/commit/fb01a2cb81730593b5eb454e68265249b832a858))

## [1.11.1](https://github.com/wearefrank/openforms2bpel/compare/v1.11.0...v1.11.1) (2023-11-22)


### 🐛 Bug Fixes

* documents service soap actions ([7096555](https://github.com/wearefrank/openforms2bpel/commit/70965553a2d78c325e853afbb069ecf3ed69de0c))

## [1.11.0](https://github.com/wearefrank/openforms2bpel/compare/v1.10.1...v1.11.0) (2023-11-21)


### 🍕 Features

* add wso2 security header in document and mtom service messages ([17e2c57](https://github.com/wearefrank/openforms2bpel/commit/17e2c57cf05590227e32bde473c27d32b65301ce))


### 🐛 Bug Fixes

* document service content type to text/xml ([90dcc9f](https://github.com/wearefrank/openforms2bpel/commit/90dcc9f313f977dc36387ab0bdaa6599f0c0a45d))


### ✅ Tests

* create mock endpoint for documents ([1a17ed5](https://github.com/wearefrank/openforms2bpel/commit/1a17ed50018fb096ec4aa4d59197f158bf06de7d))

## [1.10.1](https://github.com/wearefrank/openforms2bpel/compare/v1.10.0...v1.10.1) (2023-11-17)


### 🐛 Bug Fixes

* add namespaces to soapactions ([89469ba](https://github.com/wearefrank/openforms2bpel/commit/89469bafa06e5237178c12241269e70dd0cda7bb))

## [1.10.0](https://github.com/wearefrank/openforms2bpel/compare/v1.9.1...v1.10.0) (2023-11-10)


### 🍕 Features

* upload document data to document vault via mtom service ([31991de](https://github.com/wearefrank/openforms2bpel/commit/31991deaff348484556c6ba7be5fb130f44a0021))


### 🐛 Bug Fixes

* errorstore not triggered when error in subadapter ([ef2b524](https://github.com/wearefrank/openforms2bpel/commit/ef2b524a8d739a26dde783d5ceeb0c58ef070d4c))

## [1.9.1](https://github.com/wearefrank/openforms2bpel/compare/v1.9.0...v1.9.1) (2023-11-10)


### 🐛 Bug Fixes

* bpel register documents true false and count missing ([d7afd26](https://github.com/wearefrank/openforms2bpel/commit/d7afd2649d945242c7e48a3efa97b19716c0c745))

## [1.9.0](https://github.com/wearefrank/openforms2bpel/compare/v1.8.0...v1.9.0) (2023-11-10)


### 🍕 Features

* add document metadata to case for all form attachments ([#27](https://github.com/wearefrank/openforms2bpel/issues/27)) ([5779a02](https://github.com/wearefrank/openforms2bpel/commit/5779a0295f8ea9f8faeb4928e5b08350a4226e09))

## [1.8.0](https://github.com/wearefrank/openforms2bpel/compare/v1.7.0...v1.8.0) (2023-11-08)


### 🍕 Features

* errorstore on notification callback for assured delivery ([4b4938c](https://github.com/wearefrank/openforms2bpel/commit/4b4938cfc7daf0a69f6c2fbfcff376375aea6be5))


### 🐛 Bug Fixes

* auth-aliases for zgw-apis default to zaken-api.jwt ([a9be018](https://github.com/wearefrank/openforms2bpel/commit/a9be018d2c036a7c1f98795e28be0bc36e5ca9d8))

## [1.7.0](https://github.com/wearefrank/openforms2bpel/compare/v1.6.5...v1.7.0) (2023-11-07)


### 🍕 Features

* retrieve openforms result pdf from openzaak and pass to bpel ([b10d642](https://github.com/wearefrank/openforms2bpel/commit/b10d6426cdc2033cd5d3a3042845f577b5371e8c))

## [1.6.5](https://github.com/wearefrank/openforms2bpel/compare/v1.6.4...v1.6.5) (2023-11-03)


### 🐛 Bug Fixes

* remove data element from summary & insert form element per form section ([a90c2f6](https://github.com/wearefrank/openforms2bpel/commit/a90c2f6e21416bcd692e5e3771e3e720e158dd58))

## [1.6.4](https://github.com/wearefrank/openforms2bpel/compare/v1.6.3...v1.6.4) (2023-11-03)


### 🧑‍💻 Code Refactoring

* digid as domain value when digid was used ([#24](https://github.com/wearefrank/openforms2bpel/issues/24)) ([a7977db](https://github.com/wearefrank/openforms2bpel/commit/a7977dbadea74be7148dea8ea5a0f69068274f6e))

## [1.6.3](https://github.com/wearefrank/openforms2bpel/compare/v1.6.2...v1.6.3) (2023-11-03)


### 🧑‍💻 Code Refactoring

* initiate and register bsn as user headerproperty ([616d280](https://github.com/wearefrank/openforms2bpel/commit/616d280620a45569c5e85053eb722af38fed2bf2))


### ✅ Tests

* zaaktype P9_2_KLB digid ([3d7b923](https://github.com/wearefrank/openforms2bpel/commit/3d7b923f55c81359afec34ba3cc91fc027765640))

## [1.6.2](https://github.com/wearefrank/openforms2bpel/compare/v1.6.1...v1.6.2) (2023-11-02)


### 🧑‍💻 Code Refactoring

* unwrapping of objects-api envelope ([08344ad](https://github.com/wearefrank/openforms2bpel/commit/08344ad0e1c4bf3857a30ab20b02c44406585a65))


### ✅ Tests

* lock openzaak to 1.9.0 in test docker-compose ([5b061ba](https://github.com/wearefrank/openforms2bpel/commit/5b061ba7b3794ef8ac9be9ce0d92ba881cf56317))

## [1.6.1](https://github.com/wearefrank/openforms2bpel/compare/v1.6.0...v1.6.1) (2023-11-02)


### 🐛 Bug Fixes

* producttyp filter rename to object_type ([#21](https://github.com/wearefrank/openforms2bpel/issues/21)) ([9f8aacd](https://github.com/wearefrank/openforms2bpel/commit/9f8aacdb7e9a81d8ee459e526d2a2a06954dbd15))

## [1.6.0](https://github.com/wearefrank/openforms2bpel/compare/v1.5.0...v1.6.0) (2023-10-31)


### 🍕 Features

* notificaties API subscribe and notificatie callback ([#20](https://github.com/wearefrank/openforms2bpel/issues/20)) ([61e4e42](https://github.com/wearefrank/openforms2bpel/commit/61e4e4244056bd50350c5a158c1dcd79830b984e))

## [1.5.0](https://github.com/wearefrank/openforms2bpel/compare/v1.4.0...v1.5.0) (2023-10-17)


### 🍕 Features

* objects api object_create implementation ([57848bc](https://github.com/wearefrank/openforms2bpel/commit/57848bc955dd9ed3fd616db77425b19980a72ae2))

## [1.4.0](https://github.com/wearefrank/openforms2bpel/compare/v1.3.0...v1.4.0) (2023-10-11)


### 🍕 Features

* status_create database implementation ([37a292b](https://github.com/wearefrank/openforms2bpel/commit/37a292b4739344f6c4000c94d5ece1d588dd1f31))


### 🐛 Bug Fixes

* correct validation constraint for non-bsn betrokkeneIdentificatie ([38e0703](https://github.com/wearefrank/openforms2bpel/commit/38e07031ad92f0df0c4cc33abb6486ed3e2fbb86))


### ✅ Tests

* add rol_create testcase with non-bsn betrokkeneIdentificatie ([85b1e16](https://github.com/wearefrank/openforms2bpel/commit/85b1e167141817d407e2a10fc9013b28bcf01a22))

## [1.3.0](https://github.com/wearefrank/openforms2bpel/compare/v1.2.0...v1.3.0) (2023-10-11)


### 🍕 Features

* rol_create database implementation ([8f9dd84](https://github.com/wearefrank/openforms2bpel/commit/8f9dd8457c66e731bb193fd4c00b930dcd050f57))

## [1.2.0](https://github.com/wearefrank/openforms2bpel/compare/v1.1.4...v1.2.0) (2023-10-06)


### 🍕 Features

* zaken_create database implementation ([a75797c](https://github.com/wearefrank/openforms2bpel/commit/a75797c3fc32f53b1bc9d764ecdde9c4584e1960))


### 🐛 Bug Fixes

* disable application faults on webservice senders to see errors ([5b995c6](https://github.com/wearefrank/openforms2bpel/commit/5b995c6292f8f5fdd37794bf09e94a078bdb35fd))


### 🧑‍💻 Code Refactoring

* bpel handler sessionkeys to override message properties ([a0cd8d7](https://github.com/wearefrank/openforms2bpel/commit/a0cd8d74e8a951519a21eac73ec6ccd5f86e3ad0))

## [1.1.4](https://github.com/wearefrank/openforms2bpel/compare/v1.1.3...v1.1.4) (2023-09-28)


### 🧑‍💻 Code Refactoring

* use x-forwarded-proto instead of x-scheme ([d48d295](https://github.com/wearefrank/openforms2bpel/commit/d48d2950becc24c4dd3baac2a28c0b5316be737f))

## [1.1.3](https://github.com/wearefrank/openforms2bpel/compare/v1.1.2...v1.1.3) (2023-09-28)


### 🐛 Bug Fixes

* http scheme not reflected in built urls ([aed9768](https://github.com/wearefrank/openforms2bpel/commit/aed97683ef941fe05a84b71c737268c3fbc142fd))

## [1.1.2](https://github.com/wearefrank/openforms2bpel/compare/v1.1.1...v1.1.2) (2023-09-27)


### 🐛 Bug Fixes

* enkelvoudiginformatieobject returns empty identificatie field ([eea1d38](https://github.com/wearefrank/openforms2bpel/commit/eea1d3897cc5990b7b97ac5542a8d83906fd5a92))

## [1.1.1](https://github.com/wearefrank/openforms2bpel/compare/v1.1.0...v1.1.1) (2023-09-27)


### 🧑‍💻 Code Refactoring

* disable bpel aggregator trigger on status_create ([4f00440](https://github.com/wearefrank/openforms2bpel/commit/4f0044018c60e9bef4b3ba5d4fd36100f6b1c42f))
* generate uuid outside db for backwards compatability with older postgres ([10165f1](https://github.com/wearefrank/openforms2bpel/commit/10165f12d21a0dc3aa1d2879e1e7bad2fc10e813))

## [1.1.0](https://github.com/wearefrank/openforms2bpel/compare/v1.0.3...v1.1.0) (2023-09-27)


### 🍕 Features

* create enkelvoudiginformatieobject & zaakinformatieobject db backend ([b7ed6cf](https://github.com/wearefrank/openforms2bpel/commit/b7ed6cfc5726e70a3974e1b249a342b31af5a9dc))


### 🐛 Bug Fixes

* auto-generate uuid function for postgres does not exist error ([a6402b5](https://github.com/wearefrank/openforms2bpel/commit/a6402b5b214ceb90a4aa79c80d89dd9b9363d850))


### 🧑‍💻 Code Refactoring

* refactor columnsReturned to seperate select for postgres compatability ([1f602f2](https://github.com/wearefrank/openforms2bpel/commit/1f602f288e4e3cc56cdc01b1bfbb9cacea7690d4))


### ✅ Tests

* add e2e testcasewith  openforms api call ffrom test form ([57c6533](https://github.com/wearefrank/openforms2bpel/commit/57c65334e16031e4154dcc932bb7e460e789491f))
* **docker-compose:** add optional pgadmin behind profile for openforms2bpel postgres db ([585270f](https://github.com/wearefrank/openforms2bpel/commit/585270f14f667c37832899f14329328f1791deb6))
* **docker-compose:** add optional postgres db for openforms2bpel ([d808b7d](https://github.com/wearefrank/openforms2bpel/commit/d808b7de396a8425a6bc3e2cb5ea8d3a45d29312))

## [1.0.3](https://github.com/wearefrank/openforms2bpel/compare/v1.0.2...v1.0.3) (2023-09-26)


### 🧑‍💻 Code Refactoring

* rewrite message handling ([#8](https://github.com/wearefrank/openforms2bpel/issues/8)) ([6cb5dcd](https://github.com/wearefrank/openforms2bpel/commit/6cb5dcd418a9f77e43946d2ce6172bbbdbb3b8e4))

## [1.0.2](https://github.com/wearefrank/openforms2bpel/compare/v1.0.1...v1.0.2) (2023-09-05)


### ✅ Tests

* add commented out pgadmin container to sentry docker-compose for postgres browsing ([caeff9f](https://github.com/wearefrank/openforms2bpel/commit/caeff9ff54dd30c4f59d78e6b895aaca77ebf7d8))
* add debug env vars to openforms in test-environment ([1eb9acc](https://github.com/wearefrank/openforms2bpel/commit/1eb9acc4d0fd025e44f643a2193b5ec97ce47ad6))
* add sentry instance in test-environment and add instructions to contributing.md ([9cea0f4](https://github.com/wearefrank/openforms2bpel/commit/9cea0f43da98de23d56fc6f59c8f9b3c50597d7e))
* fix nging proxy target in test-environment ([021a21d](https://github.com/wearefrank/openforms2bpel/commit/021a21dc88d01fed8311c69659cd4c40f1685e8c))
* test-environment nginx service name type for zaakbrug-staging ([e4b9a57](https://github.com/wearefrank/openforms2bpel/commit/e4b9a57b6f16a69881fe47232cc6abea96f54a3e))

## [1.0.1](https://github.com/wearefrank/openforms2bpel/compare/v1.0.0...v1.0.1) (2023-08-30)


### ⏩ Reverts

* revert "fetch tags" ([#5](https://github.com/wearefrank/openforms2bpel/issues/5)) ([5df5f0a](https://github.com/wearefrank/openforms2bpel/commit/5df5f0ac63a190da38f1306bd992e66184b36185))


### 🔁 Continuous Integration

* lock analyze-commit dependency to older working version ([a2ca395](https://github.com/wearefrank/openforms2bpel/commit/a2ca39591385544e13031dc58bb8f807babaf20b))
* revert to conventional-changelog-conventionalcommits to 6.1.0 due to breaking change ([4b6d316](https://github.com/wearefrank/openforms2bpel/commit/4b6d3162ef933ce45069b7f8924dc14968286290))
* test ([4a5b61c](https://github.com/wearefrank/openforms2bpel/commit/4a5b61ce018e99e61e338e654667ac9bb484f863))
