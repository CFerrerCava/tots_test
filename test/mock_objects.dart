part of './helpers/test_helpers.dart';

final AuthRequest authRequest = AuthRequest.fromJson(mockAuthRequestJson);

final AuthModelResponse authModelResponse =
    AuthModelResponse.fromJson(mockAuthResponseJson);

final AuthModelResponse authModelBadResponse =
    AuthModelResponse.fromJson(mockAuthBadResponseJson);

const bearer = 'bearer';

final AuthRequest authBadRequest = AuthRequest.fromJson(mockAuthBadRequestJson);

final Exception authBadResponse = Exception();

final listOfClients = GetClientsResponse.fromJson(mockListOfClients);

const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL215YmFjay50b3RzLmFnZW5jeSIsImF1ZCI6Imh0dHBzOi8vdGVzdC50b3RzLmFnZW5jeSIsInVpZCI6IjMiLCJpZCI6IjMiLCJpYXQiOjE3MzAyODU5ODMsImV4cCI6MTczMjg3Nzk4M30.iE55If04QnqewHtW57c0RVSqBbf7cBCOSV3OXZvpnKM';

final ClientsModel clientsModelRequest =
    ClientsModel.fromJson(mockCreateClient);

final ClientsModel clientsModelBadRequest =
    ClientsModel.fromJson(mockCreateClientBadRequest);

final ClientsModel clientUpdateRequest =
    ClientsModel.fromJson(mockUpdateClient);

final ClientsModel clientUpdateBadRequest = ClientsModel();

final ClientsModel clientGetRequest = ClientsModel.fromJson(mockGetClient);
