import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/provider/season_provider.dart';

class SelectSeasonButton extends StatefulWidget {
  const SelectSeasonButton({
    super.key,
    required this.provider,
    required this.seasonsCount,
  });

  final SeasonProvider provider;
  final int seasonsCount;

  @override
  _SelectSeasonButtonState createState() => _SelectSeasonButtonState();
}

class _SelectSeasonButtonState extends State<SelectSeasonButton> {
  late int selectedSeasonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      content: IntrinsicHeight(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).width * 0.6,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListWheelScrollView.useDelegate(
            perspective: 0.007,
            squeeze: 1.5,
            onSelectedItemChanged: (value) {
              widget.provider.changeSeasonNumber(newValue: value + 1);
              selectedSeasonIndex = value;
              setState(() {});
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.seasonsCount,
              builder: (context, index) {
                return Text(
                  "Season ${index + 1}",
                  style: TextStyle(
                    fontSize: index == selectedSeasonIndex ? 30 : 26,
                    color: index == selectedSeasonIndex
                        ? Colors.white
                        : Colors.grey,
                    fontWeight: index == selectedSeasonIndex
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                );
              },
            ),
            itemExtent: 70,
            physics: const AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
