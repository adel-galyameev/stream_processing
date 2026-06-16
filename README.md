# Sequence Diagrams

## создание профиля

![создание_профиля (http)](./http/создание_профиля.png)

### Альтернативный асинхронный вариант

![создание_профиля (async)](./async/создание_профиля.png)

---

## пополнение счета

Асинхронный вариант не требуется — операция идемпотентна и выполняется атомарно без ожидания внешних подтверждений.

![пополнение_счета](./http/пополнение_счета.png)

---

## создание заказа

![создание_заказа (http)](./http/создание_заказа.png)

### Альтернативный асинхронный вариант

![создание_заказа (async)](./async/создание_заказа.png)

---

## проверка баланса

Асинхронный вариант не требуется — read-only запрос, выполняется мгновенно без побочных эффектов.

![проверка_баланса](./http/проверка_баланса.png)

---

## получить список нотификаций

Асинхронный вариант не требуется — read-only запрос возвращается без длительных операций.

![получить_список_нотификаций](./http/получить_список_нотификаций.png)

---

## OpenAPI спецификации (IDL)

Интерактивный просмотр через [Swagger Editor](https://editor.swagger.io):

| Спецификация | Описание |
|---|---|
| [`billing.yaml`](https://editor.swagger.io/?url=https://raw.githubusercontent.com/adel-galyameev/stream_processing/main/openApi/billing.yaml) | Billing API — создание пользователя, пополнение счёта, проверка баланса, списание средств |
| [`order.yaml`](https://editor.swagger.io/?url=https://raw.githubusercontent.com/adel-galyameev/stream_processing/main/openApi/order.yaml) | Order API — создание заказа |
| [`notification.yaml`](https://editor.swagger.io/?url=https://raw.githubusercontent.com/adel-galyameev/stream_processing/main/openApi/notification.yaml) | Notification API — создание профиля нотификации, получение списка уведомлений |
