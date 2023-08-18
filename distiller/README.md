This folder contains a sole script for running distiller (3C processing pipeline)
Before running, activate a relevant virtual environment (On Argonauts: source /mnt/data0/anaconda/anaconda2/bin/activate; conda activate distiller)
Config file project.yml must be editied before running
*You may comment out lines of the config file if you don't need those parameters, but you cannot comment out an entire block, as this will cause parsing errors in nextflow*

Wrapper usage:
./distiller_run.sh /path/to/project.yml

*By default, the wrapper script runs distiller in the background via nohup*
