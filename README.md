# Set up

**The instructions below assume the developer's host system is a Mac**. 

For **Linux**, `sshfs` will have to be installed via the package management system of the Linux Distribution of reference.
For **Windows**: I do not know. One thing I know for sure, the Windows user may want to [edit this](puphpet/vagrant/Vagrantfile-local#L296).

## Dependencies

- [Vagrant](https://www.vagrantup.com/downloads.html) (**minimum required version**: 1.8.6);
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (**mininum required version**: 5.0.26; **works with**: 5.1.x)
- [FUSE and SSHFS](http://osxfuse.github.io/);

## Mandatory steps

- From a terminal: 

```bash
$ vagrant plugin install vagrant-sshfs
$ git clone git@github.com:artetecha/psh-vm.git ~/vagrant/psh-vm # feel free to change the destination, but then remember you did so
$ cd ~/vagrant/psh-vm
$ cp .example.idrc .idrc
```

- Edit `.idrc` so that it reflects your usual *Git* identity;
- Make sure both your [Github](https://github.com) and [Platform.sh](https://platform.sh) accounts hold the email address you used for your *Git* identity above.
	- Whilst *Github* allows you to add multiple email addresses to your account, *Platform.sh* does not, so your main email address for this account will have to be the one in `.idrc`.
- Then
```bash
vagrant up
```
- If all went well, a unique private key was generated for you. It is located at `~/vagrant/psh-vm/puphpet/files/dot/ssh/id_rsa`;
- Add it to both your Github (https://github.com/settings/ssh) and your Platform (https://marketplace.commerceguys.com/user/<YOUR-USER-ID/ssh-keys) accounts, by copying and pasting the contents of `~/vagrant/psh-vm/puphpet/files/dot/ssh/id_rsa.pub` to the relevant area in your accounts. On Mac, you can copy the contents of that file by running `cat ~/vagrant/psh-vm/puphpet/files/dot/ssh/id_rsa.pub | pbcopy`;
- Then

```bash
$ vagrant ssh
$ mkdir ~/profiles
$ git clone git@github.com:artetecha/solas2-profile.git ~/profiles/solas2
$ git clone git@github.com:artetecha/bcshop.git ~/profiles/bcshop
$ platform list
$ platform list drupal
$ platform help deploy
```

## Done

All things being well, you are now ready to deploy and work. Remember, your VM shared folder is mounted at `~/Documents/Platform.sh`, where you will find `sites` and `profiles` (once the first deployment is run).
