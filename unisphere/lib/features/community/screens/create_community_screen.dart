import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unisphere/core/common/loader.dart';
import 'package:unisphere/features/community/controller/community_controller.dart';


class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {

  final communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
  }


  void createCommunity() {
    ref.read(communityControllerProvider.notifier).createCommunity(
      communityNameController.text.trim(),
      context,
    );
  }


  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Community"),
        centerTitle: true,
      ),
      body: isLoading ? 
      const Loader() 
      : Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Community name")),
            const SizedBox(height: 10),
            TextField(
              controller: communityNameController,
              decoration: const InputDecoration(
                hintText: "r/Community_name",
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
              maxLength: 21,
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: createCommunity, 
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Create Community",
            style: TextStyle(
              fontSize: 17,
              ),
            ),
            ),
          ],
        ),
      ),

    );
  }
}