import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';

part 'addon_model.freezed.dart';

@freezed
abstract class AddOnModel with _$AddOnModel {
  const AddOnModel._();

  const factory AddOnModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default(0.0) double price,
    @Default('') String unit,

    int? lastUpdated,
    int? dateAdded,
    @Default(false) bool isDeleted,
    @Default(true) bool isAvailable,
  }) = _AddOnModel;

  factory AddOnModel.fromEntity(AddOnEntity entity) {
    return AddOnModel(
      id: entity.id ?? '',
      title: entity.title ?? '',
      description: entity.description ?? '',
      price: entity.price ?? 0.0,
      unit: entity.unit ?? '',
      lastUpdated: entity.lastUpdated,
      dateAdded: entity.dateAdded,
      isDeleted: entity.isDeleted ?? false,
      isAvailable: entity.isAvailable ?? true,
    );
  }

  factory AddOnModel.fromMap(Map<String, dynamic> map) {
    return AddOnModel(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      unit: map['unit'] as String? ?? '',

      lastUpdated: map['lastUpdated'] as int?,
      dateAdded: map['dateAdded'] as int?,
      isDeleted: (map['isDeleted'] as int? ?? 0) == 1,
      isAvailable: (map['isAvailable'] as int? ?? 1) == 1,
    );
  }

  AddOnEntity toEntity() {
    return AddOnEntity(
      id: id.isEmpty ? null : id,
      title: title.isEmpty ? null : title,
      description: description.isEmpty ? null : description,
      price: price,
      unit: unit.isEmpty ? null : unit,
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
      'description': description,
      'price': price,
      'unit': unit,
      'lastUpdated': lastUpdated,
      'dateAdded': dateAdded,
      'isDeleted': isDeleted ? 1 : 0,
      'isAvailable': isAvailable ? 1 : 0,
    };
  }
}
