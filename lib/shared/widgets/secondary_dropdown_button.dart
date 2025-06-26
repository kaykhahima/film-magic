import 'package:flutter/material.dart';

import 'app_card.dart';

class SecondaryDropdownButton extends StatelessWidget {
  const SecondaryDropdownButton({
    super.key,
    this.onTap,
    this.selectedValue,
    this.label,
  });

  final VoidCallback? onTap;
  final String? selectedValue;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label ?? 'Select an option'),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 55,
            child: AppCard(
              borderColor: Theme.of(context).colorScheme.outline,
              backgroundColor: onTap == null
                  ? Theme.of(context).disabledColor.withValues(alpha: 0.1)
                  : null,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedValue ?? 'Select an option',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
