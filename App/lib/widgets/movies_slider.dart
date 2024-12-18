import 'package:cine_match/constants.dart';
import 'package:cine_match/screens/details_screen.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  final VoidCallback onReloadFavorite;

  const MoviesSlider({
    super.key,
    required this.snapshot,
    required this.onReloadFavorite,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      onReloadFavorite: onReloadFavorite,
                      movie: snapshot.data[index],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot.data![index].posterPath}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
