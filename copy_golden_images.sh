#!/bin/bash

# Step 1: Run Flutter tests
echo "Running flutter tests..."
flutter test || { echo "Flutter tests failed. Exiting."; exit 1; }

# Step 2: Change to the test directory
TEST_DIR="./test"
if [ ! -d "$TEST_DIR" ]; then
  echo "Test directory not found. Exiting."
  exit 1
fi

cd "$TEST_DIR" || exit

# Step 3: Recursively find all macos directories and process them
echo "Scanning for macOS directories..."
find . -type d -name "macos" | while read -r MACOS_DIR; do
  # Define the corresponding linux directory
  PARENT_DIR=$(dirname "$MACOS_DIR")
  LINUX_DIR="$PARENT_DIR/linux"

  # Check if the linux directory exists
  if [ ! -d "$LINUX_DIR" ]; then
    # Create the linux directory
    mkdir -p "$LINUX_DIR"
    echo "Created linux directory: $LINUX_DIR"

    # Copy files from macOS to linux directory
    for FILE in "$MACOS_DIR"/*; do
      if [ -f "$FILE" ]; then
        # Get the base filename
        BASE_FILENAME=$(basename "$FILE")

        # Replace "macos" with "linux" in the filename
        NEW_FILENAME=$(echo "$BASE_FILENAME" | sed 's/macos/linux/')

        # Copy the file to the linux directory with the new name
        cp "$FILE" "$LINUX_DIR/$NEW_FILENAME"
        echo "Copied $FILE to $LINUX_DIR/$NEW_FILENAME"
      fi
    done
  else
    echo "Linux directory already exists: $LINUX_DIR"
  fi
done

echo "All applicable macOS test cases have been processed."
