// ignore_for_file: constant_identifier_names
enum AssetImages {
  im_splash_logo,
}

enum AssetIcons {
  ic_export,
  ic_git_branch,
  ic_house_line,
  ic_Info,
  ic_scroll,
  ic_shield_check,
  ic_star,
  ic_wrench,
  ic_arrow_up_right,
}

class _AssetPaths {
  static const String _baseImagePath = 'assets/images/';
  static const String _baseIconPath = 'assets/icons/';
}

enum ImageType {
  png,
  jpg,
}

enum IconType {
  svg,
  png,
}

extension AssetImageName on AssetImages {
  String path({ImageType imageType = ImageType.png}) =>
      '${_AssetPaths._baseImagePath}${name.trim()}.${imageType.name.trim()}';
}

extension AssetIconName on AssetIcons {
  String path({IconType iconType = IconType.svg}) =>
      '${_AssetPaths._baseIconPath}${name.trim()}.${iconType.name.trim()}';
}
