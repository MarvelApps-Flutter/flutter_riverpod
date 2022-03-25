class UserRequest {
  final bool isFemale;
  final int minAge;

  const UserRequest({
    required this.isFemale,
    required this.minAge,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRequest &&
          runtimeType == other.runtimeType &&
          isFemale == other.isFemale &&
          minAge == other.minAge;

  @override
  int get hashCode => isFemale.hashCode ^ minAge.hashCode;
}