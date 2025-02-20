enum NavigationRoute {
  homeScreen("/home"),
  detailScreen("/detail"),
  navbarScreen("/navbar"),
  favoriteScreen("/favorite"),
  settingScreen("/settings"),;

  const NavigationRoute(this.name);

  final String name;
}
