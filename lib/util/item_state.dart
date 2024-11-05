enum ItemState {
  edit('edit'),
  delete('delete'),
  create('create');

  final String state;
  const ItemState(this.state);
}
