int getExtendedVersionNumber(String version) {
  try {
    final cleanVersion = version.split(RegExp(r'[-+]')).first;
    final versionCells = cleanVersion.split('.').map(int.parse).toList();
    while (versionCells.length < 3) {
      versionCells.add(0);
    }

    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  } catch (_) {
    return 0;
  }
}
