
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../src/common/view_model/common_view_model.dart';

class MultiProviderClass {
  static List<SingleChildWidget> providerLists = [
    ChangeNotifierProvider(create: (context) => CommonViewModel()),
  ];
}
