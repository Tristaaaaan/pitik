import 'package:equatable/equatable.dart';

class PackageEntity extends Equatable {
  final String? id;
  final String title;
  final String? branding;
  final String? description;
  final String? note;
  final List<String> inclusion;
  final double price;
  final int? lastUpdated;
  final int? dateAdded;
  final bool? isDeleted;
  final bool? isAvailable;

  const PackageEntity({
    this.id,
    required this.title,
    this.branding,
    this.description,
    this.note,
    this.inclusion = const [],
    required this.price,
    this.lastUpdated,
    this.dateAdded,
    this.isDeleted,
    this.isAvailable,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    branding,
    description,
    note,
    inclusion,
    price,
    lastUpdated,
    dateAdded,
    isDeleted,
    isAvailable,
  ];
}
