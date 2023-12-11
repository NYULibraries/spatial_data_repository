
# ✨ Contributing ✨
NYU's Spatial Data Repository (SDR) is a collaborative open source project where contributions are welcome.  
This contributing guide is borrowed in part from [Geoblacklight](https://github.com/geoblacklight/geoblacklight/blob/master/CONTRIBUTING.md).

Contents:
- [Who can contribute?](#who-can-contribute)
- [What kinds of contributions are wanted?](#what-kinds-of-contributions-are-wanted)
- [How to add a GitHub issue](#how-to-add-a-github-issue)
- [How to submit a pull request](#how-to-submit-a-pull-request)
- [Software Versioning](#software-versioning)
- [Development Guide](#development-guide)


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

### Development Guide

- Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) on your local machine. If you are on Mac and have [Homebrew](https://brew.sh/) installed, `brew cask install virtualbox && brew cask install vagrant` should be sufficent. If not, submit an [issue](https://github.com/NYULibraries/spatial_data_repository/issues)!

- Clone the master branch of the SDR to your desktop with  `cd ~/Desktop && git clone https://github.com/NYULibraries/spatial_data_repository.git`

- Change directory into the local SDR `cd ~/Desktop/spatial_data_repository`

- Start the virtual machine with `vagrant up`, then enter it with `vagrant ssh`

- Within the VM, change directory with `cd /vagrant/sdr`

- Load the database schema with `bundle exec rake db:schema:load`

- Start the Solr + SDR servers with `bundle exec rake sdr:server`
- Open the development SDR running locally in your browser at http://localhost:3000

- Test your changes by editing the project files using your favorite text editor, e.g., [Atom](https://atom.io/)

- When you are done:
  + quit the webserver with `Ctl-C`
  + exit the virtual machine by typing the command `exit`
  + stop the virtual machine with the command `vagrant halt`

- If you have changes to contribute, submit a pull request (see [above](#how-to-submit-a-pull-request))
