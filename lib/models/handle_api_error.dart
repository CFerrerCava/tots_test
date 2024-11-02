enum Status {
  completed(200),
  created(201),
  error(500);

  final int statusCode;
  const Status(this.statusCode);
}
