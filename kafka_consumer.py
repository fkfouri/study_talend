from kafka_cfg import KAFKA_TOPIC, KAFKA_CONSUMER
from confluent_kafka import Consumer

if __name__ == "__main__":

    c = Consumer(KAFKA_CONSUMER)
    c.subscribe(KAFKA_TOPIC)

    while True:
        msg = c.poll(1.0)
        if msg is None:
            continue
        if msg.error():
            print(f"Consumer error: {msg.error()}")

        print(f"Received message: {msg.value().decode('utf-8')}")