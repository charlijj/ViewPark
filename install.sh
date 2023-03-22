# Create Include for PHP Home Directory
home=$PWD
project_include=www/include/defines.php

echo "Generating $project_include"
echo "<?php \$project_home=\"$home\"; ?>" > $project_include
