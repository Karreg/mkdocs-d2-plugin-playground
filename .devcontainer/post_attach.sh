#!/bin/bash

pip3 install -q -U -r requirements.txt

# run with xvfb only when needed
if command -v xvfb-run &> /dev/null
then 
    # grep value is to ignore chromium errors in container
    xvfb-run -a mkdocs serve --open | grep -i -v "dbus\|gpu\|bus.cc"
else
    mkdocs serve --open
fi
