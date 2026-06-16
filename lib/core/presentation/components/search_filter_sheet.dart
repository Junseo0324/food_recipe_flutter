import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/filter_buttons.dart';
import 'package:flutter_recipe_app/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app/domain/filter/filter_state.dart';

import '../../../ui/text_styles.dart';

class SearchFilterSheet extends StatefulWidget {
  final FilterState state;
  final void Function(FilterState state) onChangeFilter;

  const SearchFilterSheet(
      {super.key, required this.state, required this.onChangeFilter});

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  late FilterState _state;

  @override
  void initState() {
    super.initState();

    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 31),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Filter Search',
              style: TextStyles.smallTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Text('Time', style: TextStyles.smallTextBold),
          const SizedBox(width: 10),
          FilterButtons(
            items: ['All', 'Newest', 'Oldest', 'Popularity'],
            selectedItem: _state.time,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(time: item);
              });
            },
          ),
          SizedBox(height: 20),
          Text('Rate', style: TextStyles.smallTextBold),
          const SizedBox(width: 10),
          FilterButtons(
            items: ['5', '4', '3', '2', '1'],
            selectedItem: _state.rate.toString(),
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(rate: int.parse(item));
              });
            },
          ),
          SizedBox(height: 20),
          Text('Category', style: TextStyles.smallTextBold),
          const SizedBox(width: 10),
          FilterButtons(
            items: [
              'All',
              'Cereal',
              'Vegetables',
              'Dinner',
              'Chinese',
              'Local Dish',
              'Fruit',
              'BreakFast',
              'Spanish',
              'Lunch',
            ],
            selectedItem: _state.category,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(category: item);
              });
            },
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 174,
                child: SmallButton(
                    'Filter',
                    onPressed: () {
                      widget.onChangeFilter(_state);
                    }
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
