import 'package:advance_flutter/lab_6/que_1/variable_counter_countroller.dart';

import '../../lab_2/card_view/import_export.dart';

class GetxControllerWithNonReactiveVariables extends StatefulWidget {
  const GetxControllerWithNonReactiveVariables({super.key});

  @override
  State<GetxControllerWithNonReactiveVariables> createState() =>
      _GetxControllerWithNonReactiveVariablesState();
}

class _GetxControllerWithNonReactiveVariablesState
    extends State<GetxControllerWithNonReactiveVariables> {

  final VariableCounterController controller = Get.put(VariableCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              ' This page is about basic GetX controller with non-reactive variables. '),
        ),
        body: Center(
          child: GetBuilder<VariableCounterController>(
              builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Counter: ${controller.counter}",
                          style: TextStyle(fontSize: 26)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: controller.increase, child: Text(" + ")),
                          SizedBox(width: 20,),

                          ElevatedButton(
                            onPressed: controller.reset,
                            child: Text("Reset"),
                          ),
                        ],
                      )
                    ],
                  )),
        ));
  }
}
