require 'ruby-spark'

# Configuration
Spark.config do
  set_app_name 'RubySpark'
  set 'spark.ruby.serializer', 'oj'
  set 'spark.ruby.serializer.batch_size', 100
  set 'spark.aster', 'spark://influx:7077'
  # REST URL: spark://influx:6066
end

# Start Apache Spark
Spark.start

# Context reference
Spark.sc

# Stop Apache Spark
Spark.stop
