#!/bin/bash

## subshell: Any changes to the environment within this subshell do not 
## affect the parent shell.
(
    LD_LIBRARY_PATH="../xcom;../xthread"
    export LD_LIBRARY_PATH
    ./xserver
)