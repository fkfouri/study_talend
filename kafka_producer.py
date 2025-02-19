from faker import Faker
from kafka_cfg import KAFKA_TOPIC, KAFKA_BROKER
from confluent_kafka import Producer
import json
import uuid
from time import sleep


if __name__ == "__main__":

    p = Producer(KAFKA_BROKER)

    fake = Faker({'pt_BR'})
    date_format = "%Y-%m-%d"

    for _ in range(20):
        try:
            msg = {"name": fake.name(), "cpf": fake.cpf(), "birth_date": fake.date_of_birth(minimum_age=18, maximum_age=65).strftime(date_format)}
            msg = json.dumps(msg).encode("utf-8")
            print(msg)

            key = str(uuid.uuid4())

            p.produce(KAFKA_TOPIC[0], value=msg, key=key)
        except Exception as e:
            print(f"Error: {e}")

        sleep(.5)
        p.poll(0) 
        p.flush()

