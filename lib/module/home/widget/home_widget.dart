import 'package:flutter/material.dart';
import 'package:helpme/module/home/model/home_model.dart';
import 'package:helpme/module/home/widget/rating_widget.dart';

class PlaceCard extends StatelessWidget {
  final Result place;
  final VoidCallback onTap;
  const PlaceCard({Key? key, required this.place, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      child: Image.network(
                        "https://img.freepik.com/free-photo/restaurant-interior_1127-3394.jpg",
                        width: 170,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      place.name ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                          place.rating == null
                              ? "0.0"
                              : "${place.rating.toString()}",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      StarRating(
                        color: Colors.orangeAccent,
                        rating: place.rating ?? 0.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
