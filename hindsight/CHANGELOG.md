# Changelog

## [0.4.1](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.4.0...v0.4.1) (2026-07-03)


### Bug Fixes

* **run.sh:** ensure symlink for pg0 directory is recreated on changes ([49cba32](https://github.com/stuartp44/HindsightHomeAssistant/commit/49cba328f8d61f8e70532263e7a6e455e0674b81))


### Chores

* add MIT license with Hindsight upstream acknowledgement ([35abeda](https://github.com/stuartp44/HindsightHomeAssistant/commit/35abeda12631b57482f29faf7793138d58f1d5da))

## [0.4.0](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.3.5...v0.4.0) (2026-06-28)


### Features

* **addon:** add backup: cold for consistent PostgreSQL snapshots ([d037ae9](https://github.com/stuartp44/HindsightHomeAssistant/commit/d037ae90f4e3dfbd2be89c188d9db38f0e8d7cdd))

## [0.3.5](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.3.4...v0.3.5) (2026-06-27)


### Chores

* bump actions/checkout from 4 to 7 ([645be62](https://github.com/stuartp44/HindsightHomeAssistant/commit/645be6250ded698792df8bb1b92ceeffc32c8e93))
* bump actions/checkout from 4 to 7 ([a3e99ad](https://github.com/stuartp44/HindsightHomeAssistant/commit/a3e99ad5a70867b2d170facb5a339dec28cf7b5d))
* bump googleapis/release-please-action from 4 to 5 ([308e0ab](https://github.com/stuartp44/HindsightHomeAssistant/commit/308e0abb0237e886ed0893ab6a04d14b53cc738e))
* bump googleapis/release-please-action from 4 to 5 ([48005f7](https://github.com/stuartp44/HindsightHomeAssistant/commit/48005f79ddc90ba60a48608874f84b68fa472a3c))
* bump vectorize-io/hindsight from 0.6.2 to 0.8.3 in /hindsight ([bd15172](https://github.com/stuartp44/HindsightHomeAssistant/commit/bd15172f100d1080e6ded03ae1706cf00c686a83))
* bump vectorize-io/hindsight from 0.6.2 to 0.8.3 in /hindsight ([3061cfe](https://github.com/stuartp44/HindsightHomeAssistant/commit/3061cfe81b09dc1c3410cde9652373bcb6c48ae9))

## [0.3.4](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.3.3...v0.3.4) (2026-06-27)


### Bug Fixes

* **ci:** use docker manifest inspect to validate pinned image ([35e42e5](https://github.com/stuartp44/HindsightHomeAssistant/commit/35e42e59f300c375e50b65a9791d6de73ab00faa))

## [0.3.3](https://github.com/stuartp44/HindsightHomeAssistant/compare/v0.3.2...v0.3.3) (2026-06-27)


### Chores

* pin upstream image to 0.6.2, add Dependabot for Docker/Actions ([c7db1f9](https://github.com/stuartp44/HindsightHomeAssistant/commit/c7db1f95db45d0c76b614d906e7e320cab44affa))

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
