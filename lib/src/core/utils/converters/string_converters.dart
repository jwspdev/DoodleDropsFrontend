class StringConverters {
  static String getFullName(
      {String? firstName, String? middleName, String? lastName}) {
    return '${firstName ?? ''} ${middleName!.isEmpty ? '${middleName[0]}.' : ''} ${lastName!.isEmpty ? lastName : ''}';
  }
}
