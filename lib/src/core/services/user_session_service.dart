
class UserSessionService {
  String? _activeUsername;

  String? get activeUsername => _activeUsername;

  void setActiveUser(String username) {
    _activeUsername = username;
  }
}