## Place local configuration variables used by Pulsar and run.sh in here. For example

## If using the drmaa queue manager, you will need to set the DRMAA_LIBRARY_PATH variable,
## you may also need to update LD_LIBRARY_PATH for underlying library as well. 
#export DRMAA_LIBRARY_PATH=/path/to/libdrmaa.so


## If you wish to use a variety of Galaxy tools that depend on galaxy.eggs being defined, 
## set GALAXY_HOME to point to a copy of Galaxy.
#export GALAXY_HOME=/path/to/galaxy-dist
export PYTHONPATH=${PYTHONPATH}:/usr/local/pulsar/galaxy/lib/

## Uncomment to verify GALAXY_HOME is set properly before starting the Pulsar.
export TEST_GALAXY_LIBS=1

## If using a manager that runs jobs as real users, be sure to load your Python
## environement in here as well.
# . .venv/bin/activate
