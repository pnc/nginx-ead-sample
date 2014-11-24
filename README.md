This repository contains an example configuration for serving pre-processed [EAD](http://www.loc.gov/ead/) files using the [nginx](http://nginx.org) webserver.

# Getting started

This repository contains a script that will create a virtual machine on your server running nginx. If you just want to see the configuration file so that you can apply it to an existing server, look in `default-site.conf`.

To run the eaxmple, you'll need to install [Vagrant](https://www.vagrantup.com) on your machine.

This repository contains a script (called a `Vagrantfile`) that will tell Vagrant how to configure the virtual machine.

To create the virtual machine, navigate to a directory and run:

    git clone https://github.com/pnc/nginx-ead-sample.git --recursive
    cd nginx-ead-sample
    vagrant up

If the `vagrant up` command completes without errors, you should be able to view a sample (styled!) EAD file by pointing your browser to [http://localhost:8080/syr-aaie.xml](http://localhost:8080/syr-aaie.xml).

If it doesn't work, please [https://github.com/pnc/nginx-ead-sample/issues/new](create an issue) with the output of the command or a description of where you got stuck.

# Acknowledgements

The XSLT stylesheet used is from the [SAA Encoded Archival Entity Roundtable](http://www2.archivists.org/groups/encoded-archival-description-ead-roundtable).
