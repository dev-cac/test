class Band {
  String id;
  String name;
  int votes;

  Band({
    this.id = 'default_id',
    required this.name,
    this.votes = 0
  });

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
    id: obj.containsKey('id') ? obj['id'] : 'id',
    name: obj.containsKey('name') ? obj['name'] : 'name',
    votes: obj.containsKey('votes') ? obj['votes'] : 0,
  );
}
