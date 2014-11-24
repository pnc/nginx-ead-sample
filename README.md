This repository contains an example configuration for serving pre-processed [EAD](http://www.loc.gov/ead/) files using the [Nginx](http://nginx.org) web server.

# About

This repository contains files that will:

  1. Create an Ubuntu Server virtual machine on your computer
  2. Automatically install the Nginx web server to this virtual machine
  3. Configure the web server so that it serves XML files using an XSLT stylesheet
  4. Make the web server available on your local machine at [http://localhost:8080/](http://localhost:8080/).

__If you just want to see the configuration file so that you can apply it to an existing server, look in `default-site.conf`.__

This repository contains a script (called a `Vagrantfile`) that will tell Vagrant how to configure the virtual machine. The virtual machine created by this step is just vanilla Ubuntu Server machine, with no special software.

It also contains a Bash shell script (sorry) called `setup.sh` that will be run on the virtual machine, which turns the vanilla machine into a web server by installing several packages and installing the sample configuration file.

Finally, this repository contains a sample configuration (`default-site.conf`) for Nginx that tells it to pre-process XML files using an XSLT stylesheet.

# Getting started

To run the example, you'll need to install [Vagrant](https://www.vagrantup.com) on your machine. Vagrant is a tool that automatically creates and configures virtual machines, saving you from having to create one yourself (which typically involves answering a lot of terse installer questions.) It also means the configuration of the virtual machine is encoded in a machine-readable script rather than as a set of human instructions.

You will also need to know how to open a terminal and change directories. Instructions [for OS X are available.](http://mac.appstorm.net/how-to/utilities-how-to/how-to-use-terminal-the-basics/)

To create the virtual machine, open a terminal, navigate to the directory where you want to keep this repository, and run:

    git clone https://github.com/pnc/nginx-ead-sample.git --recursive
    cd nginx-ead-sample
    vagrant up

If the `vagrant up` command completes without errors, you should be able to view a sample (styled!) EAD file by pointing your browser to [http://localhost:8080/syr-aaie.xml](http://localhost:8080/syr-aaie.xml).

If it doesn't work, please [create an issue](https://github.com/pnc/nginx-ead-sample/issues/new) with copy-and-pasted output from your terminal and/or a description of where you got stuck.

When you are finished, run

    vagrant halt

in a terminal so the virtual machine stops running and doesn't make your computer run slower.

To reclaim the hard drive space used by the virtual machine, run

    vagrant destroy

and answer `y` to the prompts.

# Making changes

You can put other EAD files into the `nginx-ead-sample` directory created above and view their styled versions using the web server. You can view a list of all the files in the directory by going to [http://localhost:8080/](http://localhost:8080/).

If you want to make modifications to the XSLT template or try one of the other samples (caveat emptor: I've only tried the Archives of American Art one), you can change either the `.xsl` file itself or point the web server at another `.xsl` file by changing the line that begins `xslt_stylesheet` in `default-site.conf`. File paths that begin with `/vagrant/` in the configuration file will be mapped to this repository's directory automatically by Vagrant.

You'll then need to run `vagrant provision` to make it pick up your changes.

If you start getting `500` error responses, you will want to check the Nginx error log for a detailed error. You can do this by running

    vagrant ssh -- "cat /var/log/nginx/error.log"

I highly recommend using a programming editor rather than a text editor when working with XML or XSLT. Some free options for OS X are [TextMate2](https://github.com/textmate/textmate#download) and [Atom](https://atom.io).

# Acknowledgements

The XSLT stylesheet used is from the [SAA Encoded Archival Entity Roundtable](http://www2.archivists.org/groups/encoded-archival-description-ead-roundtable).
