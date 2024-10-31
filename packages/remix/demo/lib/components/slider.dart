import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Slider Component',
  type: Slider,
)
Widget buildButtonUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);
  return KeyedSubtree(
    key: _key,
    child: Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Slider(
            onChanged: (value) => knobState.updateKnob('value', value),
            disabled: context.knobs.boolean(
              label: 'disabled',
              initialValue: false,
            ),
            divisions: context.knobs.int.input(
              label: 'divisions',
              initialValue: 0,
            ),
            value: context.knobs.double.slider(
              label: 'value',
              min: 0,
              max: 1,
              initialValue: 0.25,
            ),
          ),
        ),
      ),
    ),
  );
}