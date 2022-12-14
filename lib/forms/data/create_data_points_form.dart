import 'package:auto_route/annotations.dart';
import 'package:easyt/data/data.dart';
import 'package:easyt/data/provider.dart';
import 'package:easyt/forms/data/create_data_point.dart';
import 'package:easyt/misc/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateDataPointsForm extends StatefulWidget {
  final String collectionId;
  const CreateDataPointsForm(
      {Key? key, @PathParam("collectionId") required this.collectionId})
      : super(key: key);

  @override
  State<CreateDataPointsForm> createState() => _CreateDataPointsFormState();
}

class _CreateDataPointsFormState extends State<CreateDataPointsForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  DataGroup dataGroup = DataGroup.local(DateTime.now(), []);

  @override
  void initState() {
    super.initState();
    for (NamedType namedType
        in Provider.of<CollectionProvider>(context, listen: false)
            .getCollectionNamedTypes(widget.collectionId)) {
      dataGroup.dataPoints.add(DataPoint.local(namedType, ""));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _createDataPoints() {
    Provider.of<DataProvider>(context, listen: false)
        .addDataGroup(widget.collectionId, dataGroup);
    Navigator.pop(context);
  }

  void _addDataPoint() {
    setState(() {
      dataGroup.dataPoints.add(DataPoint.blank());
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (DataPoint dataPoint in dataGroup.dataPoints) {
      children.add(CreateDataPointWidget(
        dataPoint: dataPoint,
        deleteCallback: () {
          setState(() {
            dataGroup.dataPoints.remove(dataPoint);
          });
        },
        isUsedNamedTypeCallback: (NamedType namedType) =>
            Provider.of<CollectionProvider>(context, listen: false)
                .getCollectionNamedTypes(widget.collectionId)
                .contains(namedType),
        onError: () {
          // TODO: indicate error
          dataGroup.dataPoints.remove(dataPoint);
        },
      ));
    }
    children.addAll([
      ElevatedButton(onPressed: _addDataPoint, child: const Icon(Icons.add)),
      DateTimePicker(onChanged: (date) => dataGroup.date = date),
      ElevatedButton(onPressed: _createDataPoints, child: const Text("Create"))
    ]);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(children: children),
      ),
    );
  }
}
