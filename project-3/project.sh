#!/bin/bash

find sandbox -name \*.tmp | xargs rm
grep -r -i --include \*.html oncology sandbox > oncology-pages
grep -r -i --include \*.html radiology sandbox > radiology-pages
diff oncology-pages radiology-pages > diff-pages

