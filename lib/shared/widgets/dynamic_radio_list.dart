import 'package:flutter/material.dart';

import 'input_fields.dart';

class DynamicRadioList<T> extends StatefulWidget {
  const DynamicRadioList({
    super.key,
    required this.items,
    this.onSelected,
    this.selectedValue,
    this.isSearchable = false,
  });

  final List<T> items;
  final Function(T?)? onSelected;
  final T? selectedValue;
  final bool isSearchable;

  @override
  State<DynamicRadioList<T>> createState() => _DynamicRadioListState<T>();
}

class _DynamicRadioListState<T> extends State<DynamicRadioList<T>> {
  final _searchController = TextEditingController();

  String _keyword = '';
  List<T> _filteredItems = [];

  @override
  @override
  void initState() {
    _filteredItems = widget.items;
    _searchController.addListener(() {
      setState(() {
        _keyword = _searchController.text;
        _filteredItems = _keyword.isEmpty
            ? widget.items
            : widget.items
                  .where(
                    (item) => item.toString().toLowerCase().contains(
                      _keyword.toLowerCase(),
                    ),
                  )
                  .toList();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _keyword = '';
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.isSearchable)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: InputField(
                controller: _searchController,
                hintText: 'Search...',
                suffixIcon: _keyword.isEmpty
                    ? const Icon(Icons.search)
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _keyword = '';
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                          setState(() {});
                        },
                      ),
                onChanged: (value) {
                  setState(() {
                    _keyword = value;
                  });
                },
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return RadioListTile<T>(
                  title: Text(item.toString()),
                  value: item,
                  groupValue: widget.selectedValue,
                  onChanged: (value) {
                    if (value != null) {
                      widget.onSelected?.call(value);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
