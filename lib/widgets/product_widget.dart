import 'package:containerapp/utils/color_contraints.dart';
import 'package:containerapp/utils/font_contraints.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String productPrice;
  const ProductWidget({super.key, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://img.drz.lazcdn.com/static/pk/p/8ce3e007e5d4f7bfc0dfc00bf5c06970.jpg_720x720q80.jpg_.webp"),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 2, right: 10, top: 1, bottom: 2),
            child: Text(
              "HOCE Luxury Gradient Phone Cases For iPhone 11 12 13 14 15 16 Pro Max X XR XS Max 14 15 16 Plus Case Glitter Bling Grily Soft Bumper Cover",
              style: TextStyle(
                  color: ColorConstraints.textColorDark,
                  overflow: TextOverflow.ellipsis,
                  fontSize: FontConstraints.SubHeadingSize),
              maxLines: 2,
            ),
          ),
          Row(
            children: [
              Text(
                productPrice,
                style: TextStyle(
                    color: ColorConstraints.primaryColor,
                    overflow: TextOverflow.ellipsis,
                    fontSize: FontConstraints.SubHeadingSize),
                maxLines: 2,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "86%",
                style: TextStyle(
                    // decoration: TextDecoration.lineThrough,
                    color: ColorConstraints.textColorDark,
                    overflow: TextOverflow.ellipsis,
                    fontSize: FontConstraints.smallParaSize),
                maxLines: 2,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
              Text("(32332)")
            ],
          )
        ],
      ),
    );
  }
}

Widget productWidget({required productPrice}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    width: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://img.drz.lazcdn.com/static/pk/p/8ce3e007e5d4f7bfc0dfc00bf5c06970.jpg_720x720q80.jpg_.webp"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2, right: 10, top: 1, bottom: 2),
          child: Text(
            "HOCE Luxury Gradient Phone Cases For iPhone 11 12 13 14 15 16 Pro Max X XR XS Max 14 15 16 Plus Case Glitter Bling Grily Soft Bumper Cover",
            style: TextStyle(
                color: ColorConstraints.textColorDark,
                overflow: TextOverflow.ellipsis,
                fontSize: FontConstraints.SubHeadingSize),
            maxLines: 2,
          ),
        ),
        Row(
          children: [
            Text(
              productPrice,
              style: TextStyle(
                  color: ColorConstraints.primaryColor,
                  overflow: TextOverflow.ellipsis,
                  fontSize: FontConstraints.SubHeadingSize),
              maxLines: 2,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "86%",
              style: TextStyle(
                  // decoration: TextDecoration.lineThrough,
                  color: ColorConstraints.textColorDark,
                  overflow: TextOverflow.ellipsis,
                  fontSize: FontConstraints.smallParaSize),
              maxLines: 2,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Text("(32332)")
          ],
        )
      ],
    ),
  );
}
