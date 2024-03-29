[![conventional commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-green.svg)](https://semver.org)

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
