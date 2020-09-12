import 'package:slugify2/slugify.dart';

extension SlugExtenstion on String {
  String toSlug() {
    Slugify slugify = Slugify();
    String slug = slugify.slugify(this);
    return slug;
  }
}
