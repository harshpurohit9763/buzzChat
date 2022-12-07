import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Row(
            children: [
              SizedBox(
                width: Get.width - 70,
                child: TextFormField(
                  controller: authCtrl.phoneNumber,
                  decoration: const InputDecoration(
                      hintText: 'Search', focusColor: Colors.white),
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                  onPressed: () async {
                    await authCtrl.onSearch();
                  },
                  icon: const Icon(Icons.stream_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
