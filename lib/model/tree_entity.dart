import 'package:json_annotation/json_annotation.dart';

part 'tree_entity.g.dart';


@JsonSerializable()
class Tree extends Object {

	@JsonKey(name: 'data')
	List<TreeData> data;

	@JsonKey(name: 'errorCode')
	int errorCode;

	@JsonKey(name: 'errorMsg')
	String errorMsg;

	Tree(this.data,this.errorCode,this.errorMsg,);

	factory Tree.fromJson(Map<String, dynamic> srcJson) => _$TreeFromJson(srcJson);

	Map<String, dynamic> toJson() => _$TreeToJson(this);

}


@JsonSerializable()
class TreeData extends Object {

	@JsonKey(name: 'children')
	List<TreeDataChildren> children;

	@JsonKey(name: 'courseId')
	int courseId;

	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'name')
	String name;

	@JsonKey(name: 'order')
	int order;

	@JsonKey(name: 'parentChapterId')
	int parentChapterId;

	@JsonKey(name: 'userControlSetTop')
	bool userControlSetTop;

	@JsonKey(name: 'visible')
	int visible;

	TreeData(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

	factory TreeData.fromJson(Map<String, dynamic> srcJson) => _$TreeDataFromJson(srcJson);

	Map<String, dynamic> toJson() => _$TreeDataToJson(this);

}


@JsonSerializable()
class TreeDataChildren extends Object {

	@JsonKey(name: 'children')
	List<dynamic> children;

	@JsonKey(name: 'courseId')
	int courseId;

	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'name')
	String name;

	@JsonKey(name: 'order')
	int order;

	@JsonKey(name: 'parentChapterId')
	int parentChapterId;

	@JsonKey(name: 'userControlSetTop')
	bool userControlSetTop;

	@JsonKey(name: 'visible')
	int visible;

	TreeDataChildren(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

	factory TreeDataChildren.fromJson(Map<String, dynamic> srcJson) => _$TreeDataChildrenFromJson(srcJson);

	Map<String, dynamic> toJson() => _$TreeDataChildrenToJson(this);

}


