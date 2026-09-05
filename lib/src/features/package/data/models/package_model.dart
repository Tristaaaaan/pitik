import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/package_entity.dart';

part 'package_model.freezed.dart';

@freezed
abstract class PackageModel with _$PackageModel {
  const PackageModel._();

  const factory PackageModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') String branding,
    @Default('') String description,
    @Default('') String note,
    @Default(<String>[]) List<String> inclusion,
    @Default(0.0) double price,

    int? lastUpdated,
    int? dateAdded,
    @Default(false) bool isDeleted,
    @Default(true) bool isAvailable,
  }) = _PackageModel;

  factory PackageModel.fromEntity(PackageEntity entity) {
    return PackageModel(
      id: entity.id ?? '',
      title: entity.title,
      branding: entity.branding ?? '',
      description: entity.description ?? '',
      note: entity.note ?? '',
      inclusion: entity.inclusion,
      price: entity.price,
      lastUpdated: entity.lastUpdated,
      dateAdded: entity.dateAdded,
      isDeleted: entity.isDeleted ?? false,
      isAvailable: entity.isAvailable ?? true,
    );
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      branding: map['branding'] as String? ?? '',
      description: map['description'] as String? ?? '',
      note: map['note'] as String? ?? '',
      inclusion:
          map['inclusion'] == null || (map['inclusion'] as String).isEmpty
          ? const []
          : List<String>.from(jsonDecode(map['inclusion'] as String) as List),
      price: (map['price'] as num?)?.toDouble() ?? 0.0,

      lastUpdated: map['lastUpdated'] as int?,
      dateAdded: map['dateAdded'] as int?,
      isDeleted: (map['isDeleted'] as int? ?? 0) == 1,
      isAvailable: (map['isAvailable'] as int? ?? 1) == 1,
    );
  }

  PackageEntity toEntity() {
    return PackageEntity(
      id: id.isEmpty ? null : id,
      title: title,
      branding: branding.isEmpty ? null : branding,
      description: description.isEmpty ? null : description,
      note: note.isEmpty ? null : note,
      inclusion: inclusion,
      price: price,
      lastUpdated: lastUpdated,
      dateAdded: dateAdded,
      isDeleted: isDeleted,
      isAvailable: isAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'branding': branding,
      'description': description,
      'note': note,
      'inclusion': jsonEncode(inclusion),
      'price': price,
      'lastUpdated': lastUpdated,
      'dateAdded': dateAdded,
      'isDeleted': isDeleted ? 1 : 0,
      'isAvailable': isAvailable ? 1 : 0,
    };
  }
}
