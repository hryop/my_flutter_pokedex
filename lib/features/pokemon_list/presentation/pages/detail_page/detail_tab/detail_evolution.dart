import 'package:flutter/cupertino.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/chain/pokemon_evol_chain_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/shared/presentation/desc_row.dart';

class DetailEvolution extends StatelessWidget {
  PokemonEvolModel evolChain;

  DetailEvolution({Key? key, required this.evolChain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...getEvolInfo(),
          ],
        ),
      ),
    );
  }

  List<Widget> getEvolInfo() {
    List<Widget> evolWidget = [];

    PokemonEvolChainModel chain = evolChain.chain ?? PokemonEvolChainModel();
    List<PokemonEvolChainModel> evolvesToCheck = chain.evolves_to ?? [];

    evolWidget.add(
      DescRow(descKey: "Basic", descValue: chain.species?.name ?? ""),
    );

    int evoCount = 1;
    do {
      PokemonEvolChainModel newChain = evolvesToCheck[0];
      evolWidget.add(
        DescRow(
          descKey: "Evolution ${evoCount}",
          descValue: newChain.species?.name ?? "",
        ),
      );

      evoCount++;
      evolvesToCheck = newChain.evolves_to ?? [];
    } while (evolvesToCheck.isNotEmpty);

    return evolWidget;
  }
}
