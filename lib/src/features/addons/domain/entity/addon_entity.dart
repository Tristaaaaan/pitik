import 'package:equatable/equatable.dart';

class AddOnEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? unit;
  final int? lastUpdated;
  final int? dateAdded;
  final bool? isDeleted;
  final bool? isAvailable;

  const AddOnEntity({
    this.id,
    this.title,
    this.description,
    this.price,
    this.unit,
    this.lastUpdated,
    this.dateAdded,
    this.isDeleted,
    this.isAvailable,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    unit,
    lastUpdated,
    dateAdded,
    isDeleted,
    isAvailable,
  ];
}
