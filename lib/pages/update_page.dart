import 'package:dio_provider/models/post_model.dart';
import 'package:dio_provider/viewmodel/update_view_model.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  static const String id = 'update_page';

  Post post = Post();
  UpdatePage({this.post, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.titleTextEditingController.text = widget.post.title.toUpperCase();
    viewModel.bodyTextEditingController.text = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Post'),
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
                border: InputBorder.none,
              ),
            ),

            // Title TextField
            TextField(
              controller: viewModel.bodyTextEditingController,
              maxLines: 8,
              decoration: const InputDecoration(
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
          viewModel.apiPostUpdate(context, Post(userId: widget.post.userId, id: widget.post.id, title: viewModel.titleTextEditingController.text, body: viewModel.bodyTextEditingController.text));
        },
      ),
    );
  }
}