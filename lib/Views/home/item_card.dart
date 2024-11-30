import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
     itemCount: 10,
        itemBuilder: (context, index){
      return  Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 70,
          height: 100,
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/premium-photo/black-coluring-hudie-mocup-with-hanger-isolated-background_1304645-14969.jpg', ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ("Hoodie"),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      ("The best hoodie of this winter"),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
        });
  }
}