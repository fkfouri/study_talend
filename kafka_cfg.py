BOOT_STRAP = "localhost:9092"
KAFKA_TOPIC = ["test_topic"]
KAFKA_GROUP = "my_group"
KAFKA_BROKER = {"bootstrap.servers": BOOT_STRAP, "group.id": KAFKA_GROUP, }
KAFKA_CONSUMER = {"bootstrap.servers": BOOT_STRAP,
                  "group.id": KAFKA_GROUP, "auto.offset.reset": "earliest",
    'api.version.request': True,
    'broker.version.fallback': '0.10.0.0',
    'security.protocol': 'PLAINTEXT'  # Use 'SSL' if you are connecting to an SSL listener                  
                  }
