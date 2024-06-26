enum MessageType { failure, success }

enum ImageSelectionMode { single, multiple }

enum DatasourceType { remote, local }

enum Datasource { api, firebase, sqlite, sharedPref, fake }

enum AppOpenedBy {
  user,
  dynamicLink,
  notification,
}
