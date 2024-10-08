
# ✨ Contributing ✨

NYU's Spatial Data Repository (SDR) is a collaborative open source project where contributions are welcome.  

This contributing guide is borrowed in part from [Geoblacklight](https://github.com/geoblacklight/geoblacklight/blob/master/CONTRIBUTING.md).

Contents:
- [Who can contribute?](#who-can-contribute)
- [What kinds of contributions are wanted?](#what-kinds-of-contributions-are-wanted)
- [How to add a GitHub issue](#how-to-add-a-github-issue)
- [How to submit a pull request](#how-to-submit-a-pull-request)
- [Software Versioning](#software-versioning)

### Who can contribute?

Anyone is welcome to contribute to the SDR, though the core group at NYU will need to discuss and vet pull requests.
We follow a set of contribution practices to maintain a socially inclusive and technically sustainable software project. For more information, please visit our [Code of Conduct](CODE_OF_CONDUCT.md).

### What kinds of contributions are wanted?

- Requesting bug fixes ⁉️🐛 (submitted as [GitHub issues](#adding-github-issues))
- Requesting features ⁉️🎉 (submitted as [GitHub issues](#adding-github-issues))
- Requesting documentation ⁉️📄 (submitted as [GitHub issues](#adding-github-issues))
- Committing bug fixes ➕🐛(submitted as [pull requests](#submitting-pull-requests))
- Committing features ➕🎉 (submitted as [pull requests](#submitting-pull-requests))
- Committing documentation ➕📄 (submitted as [pull requests](#submitting-pull-requests))

### How to add a GitHub issue

Did you find a bug in the SDR or interested in a new feature? Make sure to add an issue for it in the [issue tracker](https://github.com/NYULibraries/spatial_data_repository/issues).

 - Make sure you have a [GitHub account](https://github.com/signup/free)
 - Submit a [GitHub issue](./issues) by:
    - Clearly describing the issue or request
    - Provide a descriptive summary
    - Explain the expected behavior
    - Explain the actual behavior
    - Provide steps to reproduce the actual behavior

When proposing major new features or changes that may introduce an API or schema change, please make sure to communicate this so the full implications are understood.
Likely there are ways to introduce these changes in a backwards compatible way that others may be able to help with.

### How to submit a pull request

Do you have software fixes or documentation changes to contribute to the codebase directly? If so, you'll need to create a pull request by:

 - Making sure you have a [GitHub account](https://github.com/signup/free)
 - Cloning the `spatial_data_repository` repo
 - Checking out a new branch with a name that describes your discrete change
 - Making your changes
 - Committing your changes
 - Pushing your changes + the branch that they're on
 - Opening a [pull request](https://github.com/NYULibraries/spatial_data_repository/pulls) with clear description of changes, referencing open issues they address where possible

For more robust information about the above steps, see the [Development Guide](#development-guide) below.

### Software Versioning

The SDR follows the practice of [Semantic Versioning](https://semver.org/) for software releases, tracking the versioning for Geoblacklight where possible.

The version for a given release is recorded in the `VERSION` file in the project root.
