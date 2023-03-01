import 'package:admin_pannel_p1/controllers/todo_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/todo_api_model.dart';
import '../../../network/remote/api/todo_api_call.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
        child: FutureBuilder(
          future: ToDoAPi.getToDoList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = ToDoApiModel.fromJson(snapshot.data![index]);
                    return ListTileWithToggle(data: data);
                  });
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("${snapshot.error ?? "Unknown Error"}"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class ListTileWithToggle extends StatefulWidget {
  const ListTileWithToggle({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ToDoApiModel data;

  @override
  State<ListTileWithToggle> createState() => _ListTileWithToggleState();
}

class _ListTileWithToggleState extends State<ListTileWithToggle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.data.completed,
        onChanged: (value) {
          context.read<ToDoController>().editTask = value!;
          setState(() {
            widget.data.completed = value;
          });
        },
      ),
      title: Text(widget.data.title!),
    );
  }
}
