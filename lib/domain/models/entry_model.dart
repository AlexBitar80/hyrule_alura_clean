// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Entry {
  final int id;
  final String name;
  final String image;
  final String description;
  final String commonLocation;
  final String category;

  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonLocation,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'common_locations': commonLocation,
      'category': category,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      commonLocation: jsonEncode(map['common_locations'] ?? ['Sem localização']),
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) =>
      Entry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Entry other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.description == description &&
        other.commonLocation == commonLocation &&
        other.category == category;
  }

  List<String> commonLocationConverted() {
    return (jsonDecode(commonLocation) as List<dynamic>).map((e) => e as String).toList();
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        commonLocation.hashCode ^
        category.hashCode;
  }
}
