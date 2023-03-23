# Create Include for PHP Home Directory
home=$PWD
project_include=www/include/defines.php

echo "Generating $project_include"
echo "<?php \$project_home=\"$home\"; ?>" > $project_include

# Install sql test data
sql_db=sql/viewpark.db
sql_create=sql/create_tables.sql
sql_drop=sql/drop_tables.sql
sql_data=sql/data.sql

echo "Dropping old tables"
sqlite3 $sql_db < $sql_drop

echo "Create new tables"
sqlite3 $sql_db < $sql_create

echo "Copying test data"
sqlite3 $sql_db < $sql_data
