#!/bin/bash

find storage bootstrap/cache public -type f -exec chmod o+w {} \;
find storage bootstrap/cache public -type d -exec chmod o+wx {} \;
chmod o-w public/index.php
chmod 777 -R storage/logs