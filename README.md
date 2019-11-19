# Jenkins Docker Example

An example repo to demonstrate how to run builds and pipelines using Jenkinsfile declarative syntax with a built in Dockerfile for capturing build environments. Docker containers offer a consistent build environment that can be version controlled and run from a clean slate every build. By having developers and build pipelines run from the same container the application builds can be tightly controlled and ensure that environments between developers and build machines don't diverge.

## Requirements

* Jenkins 2.x or later
* A Jenkins agent with Docker installed. Note that it might be necessary to configure Jenkins to only send Docker jobs to specific agents if Docker is not installed on every agent.
* Docker

## Usage - Jenkins

Make sure Jenkins is configured with at least 1 agent that has Docker installed and usable by the Jenkins agent user. Create a new pipeline job in Jenkins and point it to this git repo. Run the build.
Note that the Jenkinsfile must set the entrypoint of the container to '' in order for the Jenkins docker plugin to correctly use the container. More information on the entrypoint script is found below.

## Usage - Local

For local builds it is desirable to use the same build environment as the Jenkins server. The Dockerfile is built with a VOLUME that can map the application source code to a common location and a simple entrypoint script. The entrypoint script is useful for parsing arguments and environment variables necessary to configure the build as well as kicking off whatever build scripts are located in the application source code directory. It may seem redundant but it is useful to not put build specific code in the entrypoint script since this may change frequently. The entrypoint script should parse arguments and look for a valid build script located in the application mounted directory.

To make builds easier on local machines it is often times recommended to create an alias. First build the container running `docker build -t build_container .`

Then set up the alias on the local machine
`alias build="docker run --rm -it -v ${PWD}:/app -e APP_var=test1 build_container"`

Finally, in the app directory, run
`build arg1 arg2`

## Author

Josh Metheney <metheney.josh@solute.us>