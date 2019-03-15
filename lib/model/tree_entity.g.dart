// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) {
  return Tree(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : TreeData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

TreeData _$TreeDataFromJson(Map<String, dynamic> json) {
  return TreeData(
      (json['children'] as List)
          ?.map((e) => e == null
              ? null
              : TreeDataChildren.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['courseId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int);
}

Map<String, dynamic> _$TreeDataToJson(TreeData instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };

TreeDataChildren _$TreeDataChildrenFromJson(Map<String, dynamic> json) {
  return TreeDataChildren(
      json['children'] as List,
      json['courseId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int);
}

Map<String, dynamic> _$TreeDataChildrenToJson(TreeDataChildren instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
