import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class PhotoComponent extends Component<Photo> {
  PhotoComponent() : super(view: buildView);
}
