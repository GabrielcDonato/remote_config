class CustomThemeEntity {
  final int id;

  CustomThemeEntity({required this.id});

  @override
  bool operator ==(covariant CustomThemeEntity other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
