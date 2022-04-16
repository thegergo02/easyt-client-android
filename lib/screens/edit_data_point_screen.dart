import 'package:auto_route/auto_route.dart';
import 'package:easyt/forms/edit_data_point.dart';
import 'package:flutter/material.dart';

class EditDataPointScreen extends StatelessWidget {
  final String collectionId;
  final String groupId;
  final String dataId;

  const EditDataPointScreen(
      {Key? key,
      @PathParam("collectionId") required this.collectionId,
      @PathParam("groupId") required this.groupId,
      @PathParam("dataId") required this.dataId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditDataPointWidget(
        collectionId: collectionId, groupId: groupId, dataId: dataId);
  }
}