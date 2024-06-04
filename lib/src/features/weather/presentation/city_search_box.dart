import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/provider.dart';


class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({super.key});
  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 30.0;

  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          color: Colors.white.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                onSubmitted: (value) =>
                ref.read(cityProvider.notifier).state = value,
              ),
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: AppColors.accentColor.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    'Search',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              onTap: () {
                FocusScope.of(context).unfocus();
                ref.read(cityProvider.notifier).state = _searchController.text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
