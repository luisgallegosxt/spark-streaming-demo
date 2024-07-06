curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
  "name": "postgres-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "tasks.max": "1",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "postgres",
    "database.password": "postgres",
    "database.dbname": "sales_db",
    "database.server.name": "dbserver1",
    "table.include.list": "public.customers,public.products,public.sales",
    "plugin.name": "pgoutput",
    "database.history.kafka.bootstrap.servers": "<public-ip>:9092",
    "database.history.kafka.topic": "schema-changes.sales_db",
    "key.converter": "org.apache.kafka.connect.json.JsonConverter",
    "key.converter.schemas.enable": "false",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schemas.enable": "false",
    "topic.prefix": "dbserver1"
  }
}'
