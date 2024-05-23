# README

This Dockerfile builds a container for self-hosting the Ventipix Inventory Management System. It includes all the required PHP Extensions and Ioncube loader. It is based off the public PHP container with additional required modules.

However, it does not include any Ventipix Files or Source Code, you'll have to mount those yourself to the `/var/www/html` directory (make sure to set correct chown).

### Versions:

#### PHP8.2
Dockerfile8.2 features Ioncube 8.2 and should be the latest / newest version for the Ventipix Inv System.

#### PHP8.1
Dockerfile8.1 features Ioncube 8.1 and should be good to go.

#### PHP7.4
Haven't uploaded it as it's outdated / no longer recommend. May dig it up on request if needed but you're better off using the above files instead.

### Building:
Download / Create a `Dockerfile` in your source Directory including the content of your desired Dockerfile from this Repo.

Then, run the following command to generate the Docker Container, replace `{tag}` with your desired name to use when building the container:
`sudo docker build -t php:{tag} .`


### Disclaimer

I've included these, but they're probably not as efficient / streamlined as could be and may make use of redundunt commands. Use at your own risk. 😉
