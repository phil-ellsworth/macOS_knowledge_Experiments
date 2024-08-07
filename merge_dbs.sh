#!/bin/zsh

DB1="masterDB.db"
DB2="knowledgeC.db"
TARGET_DB="$DB1"

# Attach the databases and get the list of tables
tables=$(sqlite3 $TARGET_DB <<EOF
ATTACH DATABASE '$DB2' AS db2;
.tables db2
DETACH DATABASE db2;
EOF
)

# Iterate over the tables and copy data
for table in $tables; do
    echo "Merging table: $table"
    sqlite3 $TARGET_DB <<SQL
    ATTACH DATABASE '$DB2' AS db2;
    INSERT INTO main.$table SELECT * FROM db2.$table;
    DETACH DATABASE db2;
SQL
done