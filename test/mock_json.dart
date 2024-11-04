part of './helpers/test_helpers.dart';

final mockAuthRequestJson = {
  "email": "test3@tots.agency",
  "password": "123Qwerty"
};

final mockAuthResponseJson = {
  "id": 3,
  "email": "test3@tots.agency",
  "token_type": "bearer",
  "access_token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL215YmFjay50b3RzLmFnZW5jeSIsImF1ZCI6Imh0dHBzOi8vdGVzdC50b3RzLmFnZW5jeSIsInVpZCI6IjMiLCJpZCI6IjMiLCJpYXQiOjE3MzA0ODc2NTUsImV4cCI6MTczMzA3OTY1NX0.6oY9_2Pqawv9zbxS5s91-TNPsinBktv4M9d7mGFV4GQ"
};

final mockAuthBadResponseJson = {
  "id": 3,
  "email": "test3@tots.agency",
  "token_type": "bearer",
  "access_token": ""
};

final mockAuthBadRequestJson = {"email": "-==--''.'", "password": ""};

final mochAuthBadResponseJson = {
  "statusCode": 500,
  "message": "data and hash arguments required"
};

final mockListOfClients = {
  "data": [
    {
      "id": 1,
      "firstname": "Matias",
      "lastname": "Camiletti",
      "email": "matias@agencycoda.com",
      "address": "Buenos Aires, Argentina",
      "photo": null,
      "caption": null,
      "created_at": "2024-10-30T11:10:01.000Z",
      "updated_at": "2024-10-30T11:10:01.000Z",
      "user_id": 3
    },
    {
      "id": 2,
      "firstname": "Matias2",
      "lastname": "Camiletti2",
      "email": "matias2@agencycoda.com",
      "address": "Buenos Aires, Argentina",
      "photo": "22",
      "caption": "22",
      "created_at": "2024-10-30T11:10:14.000Z",
      "updated_at": "2024-10-30T11:10:14.000Z",
      "user_id": 3
    },
    {
      "id": 3,
      "firstname": "Matias",
      "lastname": "Camiletti",
      "email": "matias@agencycoda.com",
      "address": "Buenos Aires, Argentina",
      "photo": null,
      "caption": null,
      "created_at": "2024-10-30T11:23:59.000Z",
      "updated_at": "2024-10-30T11:23:59.000Z",
      "user_id": 3
    },
    {
      "id": 20,
      "firstname": "hdhe",
      "lastname": "hdrhe",
      "email": "jjdjf@df.ee",
      "address": null,
      "photo": null,
      "caption": null,
      "created_at": "2024-11-01T03:44:07.000Z",
      "updated_at": "2024-11-01T03:44:07.000Z",
      "user_id": 3
    },
    {
      "id": 21,
      "firstname": "bbdd",
      "lastname": "hdjdjd",
      "email": "beje@f.fff",
      "address": null,
      "photo": null,
      "caption": null,
      "created_at": "2024-11-01T03:44:31.000Z",
      "updated_at": "2024-11-01T03:44:31.000Z",
      "user_id": 3
    },
    {
      "id": 22,
      "firstname": "Hola",
      "lastname": "Hola",
      "email": "jfjf@fff.fff",
      "address": null,
      "photo": null,
      "caption": null,
      "created_at": "2024-11-01T12:20:17.000Z",
      "updated_at": "2024-11-01T12:20:17.000Z",
      "user_id": 3
    },
    {
      "id": 23,
      "firstname": "Matias",
      "lastname": "Camiletti",
      "email": "matias@agencycoda.com",
      "address": "Buenos Aires, Argentina",
      "photo": null,
      "caption": null,
      "created_at": "2024-11-01T22:58:54.000Z",
      "updated_at": "2024-11-01T22:58:54.000Z",
      "user_id": 3
    },
    {
      "id": 24,
      "firstname": "Matias",
      "lastname": "Camiletti",
      "email": "matias@agencycoda.com",
      "address": "Buenos Aires, Argentina",
      "photo": null,
      "caption": null,
      "created_at": "2024-11-01T23:07:09.000Z",
      "updated_at": "2024-11-01T23:07:09.000Z",
      "user_id": 3
    }
  ]
};

final mockCreateClient = {
  "firstname": "Matias",
  "lastname": "Camiletti",
  "email": "matias@agencycoda.com",
  "address": "Buenos Aires, Argentina",
  "photo": "",
  "caption": ""
};

final mockCreateClientBadRequest = {
  "firstname": "",
  "email": "matias",
  "address": "Buenos Aires, Argentina",
  "photo": "",
};

final mockCreateResponse = {"id": "25"};

final mockUpdateClient = {"id": 25};

final mockUpdateResponse = {"success": true};

final mockGetClient = {"id": 50};
