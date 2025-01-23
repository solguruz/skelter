read -p 'Automation? (y/n): ' automation

if [ "$automation" == "y" ]; then
  echo "Running in automation mode"
  # Read the version line from the pubspec.yaml file
  version_line=$(grep "^version:" pubspec.yaml)

  # Extract the version number using cut
  version=$(echo "$version_line" | cut -d ' ' -f 2)

  # Split the version into version_number and build_number using '+'
  version_number=$(echo "$version" | cut -d '+' -f 1)
  build_number=$(echo "$version" | cut -d '+' -f 2)

  distribute_all="n"
  release_notes="Release $version_number build $build_number UTC Time $(date -u) \n $(cat release_notes.txt)"

  read -p 'Android? (y/n): ' should_include_android
  include_android=$should_include_android

#  read -p 'iOS? (y/n): ' should_include_ios
#  include_ios=$should_include_ios

  else
    read -p "Enter version number (e.g., 1.0.0): " version_number
    read -p "Enter build number (e.g., 1): " build_number
    read -p "Enter release notes: " release_notes
    read -p "Include Android? (y/n): " include_android
#      read -p "Include iOS? (y/n): " include_ios
    read -p "should distribute to everyone (y/n) " distribute_all
  fi

  if [ "$distribute_all" == "y" ]; then
    echo 'Distributing to all'
    FIREBASE_GROUP="sg-internal" # add more group
  else
    echo "Not including yourself in the testers group."
    FIREBASE_GROUP="sg-internal" # change this group or ask for it
  fi

  RELEASE_NOTES="$release_notes"
  echo "\033[0;32mRelease notes: $RELEASE_NOTES\033[0m"

  echo "Building for Firebase app distribution for $FIREBASE_GROUP"

  if [ "$include_android" == "y" ]; then
    echo "Building Android..."
    set -e
    flutter build apk --build-name=$version_number --build-number=$build_number
    echo "Uploading Android to Firebase $FIREBASE_GROUP"
    firebase appdistribution:distribute ./build/app/outputs/flutter-apk/app-release.apk \
      --app 1:691451580239:android:dde89e47b02b261f5cbf3a \
      --release-notes "$RELEASE_NOTES" \
      --groups "$FIREBASE_GROUP"
  fi

#if [ "$include_ios" == "y" ]; then
#  echo "Building  iOS..."
#  set -e
#  flutter build ipa --export-method=ad-hoc --build-name=$version_number --build-number=$build_number
#  echo "Uploading to  iOS to Firebase $FIREBASE_GROUP"
#  firebase appdistribution:distribute ./build/ios/ipa/Runners.ipa \
#    --app 1:691451580239:ios:452d8eab287e44ee5cbf3a \
#    --release-notes "$RELEASE_NOTES" \
#    --groups "$FIREBASE_GROUP"
#fi

echo "🎉 Done building and distributing 🎉"
