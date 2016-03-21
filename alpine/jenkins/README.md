This is the base image for Jenkins.  It will be updated with LTS
versions only.  It only installs Jenkins and no plugins.  The assumption
is that you will bind mount the Jenkins home directory
(/var/lib/jenkins) that contains all of your jobs, plugins,
configuration data, etc.
