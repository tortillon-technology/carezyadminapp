enum LoaderState {
  initial,
  loading,
  loaded,
  hasData,
  noData,
  error,
  networkError,
  serverError
}


enum Selection{
  changed,
  notChanged,
}

enum SuspensionSelection{
  changed,
  notChanged,
  bush,
}

enum LightSelection{
  changed,
  notChanged,
  lampReplace,
}

enum SearchLoader {
  loading,
  error,
  noSearchData,
  noData,
  loaded,
}