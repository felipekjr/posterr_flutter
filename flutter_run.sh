echo "Get in all packages"
for dir in ./packages/*
do
  cd "$dir"
  flutter packages get 
  cd -
done
flutter packages get

echo "Finished get packages$"
echo "Starting build..."
flutter run