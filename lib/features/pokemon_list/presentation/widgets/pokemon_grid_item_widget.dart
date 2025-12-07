import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_pokedex/core/helper/go_router/path_go_router.dart';
import 'package:my_flutter_pokedex/core/utils/constant/network_constant.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_item_model.dart';
import 'package:my_flutter_pokedex/shared/presentation/cached_image_widget.dart';

class PokemonGridItemWidget extends StatelessWidget {
  final int index;
  final PokemonListItemModel? item;

  const PokemonGridItemWidget({super.key, required this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(detail_page+"/${getPokemonIdFromUrl(item?.url ?? "")}");
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(8),
          color: Color(0xFFd4d4d4),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedImageWidget(
                imageUrl: getPokemonArtworkPath(getPokemonIdFromUrl(item?.url ?? "")),
                width: 70,
              ),
              SizedBox(height: 8),
              Text((item?.name ?? "").toUpperCase()),
            ],
          ),
        ),
      ),
    );
  }

}
