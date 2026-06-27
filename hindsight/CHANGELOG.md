# Changelog

## [0.3.2](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.3.1...v0.3.2) (2026-06-27)


### CI

* remove ingress key check, add-on no longer uses ingress ([5a9cac3](https://github.com/stuartp44/HindsightHomeAssistant/commit/5a9cac3283803c59b66afb8b21e9591a7976cc01))

## [0.3.1](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.3.0...v0.3.1) (2026-06-27)


### Bug Fixes

* **addon:** remove configurable port options, hardcode 8888 and 9999 ([977874c](https://github.com/stuartp44/HindsightHomeAssistant/commit/977874ccca6187b30b57b3073191edf83fbdaa4e))
* **run.sh:** ensure HINDSIGHT_CP_DATAPLANE_API_KEY is set from API key file ([43073a3](https://github.com/stuartp44/HindsightHomeAssistant/commit/43073a33c58c6444b132b5fb133ba2e3e2051b72))


### Documentation

* add project README, rewrite addon README, add option translations ([efc3687](https://github.com/stuartp44/HindsightHomeAssistant/commit/efc36873d7ce4093be2fb1211747a7bdc09ac1c8))
* align README option descriptions with translations file ([1ae5657](https://github.com/stuartp44/HindsightHomeAssistant/commit/1ae56575d8e9661219b97e46ba4c7e40ff0528aa))

## [0.3.0](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.2.0...v0.3.0) (2026-06-27)


### Features

* **addon:** auto-generate persistent API and UI access keys ([b5ff7f4](https://github.com/stuartp44/HindsightHomeAssistant/commit/b5ff7f45e2a13b74d7501456493a919295bae937))


### Bug Fixes

* **config:** remove unused ingress settings and clarify port descriptions ([1edde9c](https://github.com/stuartp44/HindsightHomeAssistant/commit/1edde9c95398224582c16150975251a1cba8df29))

## [0.2.0](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.1.7...v0.2.0) (2026-06-27)


### Features

* **addon:** add Hindsight icon and logo assets ([c6870cc](https://github.com/stuartp44/HindsightHomeAssistant/commit/c6870cc84839e3d2dceeaf2059cdc01bc9c5a341))


### Bug Fixes

* **addon:** expose api port 8888 on host ([030391f](https://github.com/stuartp44/HindsightHomeAssistant/commit/030391f7ee1fd6acb2b0917fdd0564d2135db2fc))

## [0.1.7](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.1.6...v0.1.7) (2026-06-27)


### Bug Fixes

* **addon:** keep dataplane API url internal without ingress path ([a4ae455](https://github.com/stuartp44/HindsightHomeAssistant/commit/a4ae4555c7d70d17a388e9cfbc7eae127beec832))

## [0.1.6](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.1.5...v0.1.6) (2026-06-27)


### Bug Fixes

* **addon:** set explicit ingress entry for control plane ([0d9ad4b](https://github.com/stuartp44/HindsightHomeAssistant/commit/0d9ad4b92c0142760008fb5430c04831bf3ef983))

## [0.1.5](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.1.4...v0.1.5) (2026-06-27)


### CI

* **release-please:** write changelog to addon directory ([b13734d](https://github.com/stuartp44/HindsightHomeAssistant/commit/b13734d4ae4afe19e25ce11e779bddb707636a43))

## 0.1.3 - 2026-06-27

- CI: Release Please now updates the add-on config version automatically.

## 0.1.2 - 2026-06-27

- Fix: Made add-on startup user creation idempotent to avoid build failures.
- Docs: Updated release and commit message guidance.

## 0.1.1 - 2026-06-27

- CI: Added commitlint and release workflows.
- Chore: Initial add-on scaffold.
