import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(
                  Icons.movie_outlined,
                  color: Colors.deepPurpleAccent,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'Movies',
                  style: TextStyle(fontSize: 20.0,color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.deepPurpleAccent,
                    ))
              ],
            )),
      ),
    );
  }
}
