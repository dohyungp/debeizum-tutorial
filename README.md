# Debeizum 튜토리얼

1. `docker compose`를 통한 환경 띄우는 작업을 해주세요.
```sh
make up
```

2. curl로 실제 환경이 떴는지 health check를 해봅니다.

```sh
make ping
```

3. 잘 떴다면 실제 이벤트 connector를 연결합니다.

> connect.http 파일에서 `MySqlConnector`를 이용, inventory schema의 users 테이블의 변경사항을 읽어보겠습니다.

4. 제대로 connector가 설치되었는지 확인하기 위해 curl로 connectors 리스트를 확인해봅니다.

```sh
make check-connect
```

5. 잘되었다면 이제 진짜 mysql에 insert를 하며 이벤트가 들어오는지 확인해볼 차례입니다.

```sh
make mysql
```

```sql
INSERT INTO customers VALUES (default, "Dohyung", "Park", "dohyung@debezium.com");
```

6. 미리 설정해둔 watcher를 통해 이벤트가 kakfa topic으로 들어오는지 확인해보겠습니다.

```sh
docker compose logs watcher
```

7. 이제 충분히 확인했다면 다시 환경을 내려줍니다.

```sh
make down
```