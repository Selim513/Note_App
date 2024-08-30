import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomNoteContainer extends StatelessWidget {
  const CustomNoteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Flutter tips',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const Gap(5),
              SizedBox(
                width: 200,
                child: Text(
                  'Build Your career with yourself ',
                  style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                ),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Aug 29/2024',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
