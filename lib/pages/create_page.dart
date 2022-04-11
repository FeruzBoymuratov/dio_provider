import 'package:dio_provider/viewmodel/create_view_model.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'create_page';
  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Title TextField
            TextField(
              controller: viewModel.titleTextEditingController,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),

            // Title TextField
            TextField(
              controller: viewModel.bodyTextEditingController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: 'Body',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.upload_outlined),
        onPressed: () {
          viewModel.apiPostCreate(context, viewModel.titleTextEditingController.text, viewModel.bodyTextEditingController.text);
        },
      ),
    );
  }
}