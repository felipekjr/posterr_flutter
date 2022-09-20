echo "Get in all packages"
for dir in ./packages/*
do
  cd "$dir"
  fvm flutter packages get 
  cd -
done
fvm flutter packages get

echo "Finished get packages$"
echo "Starting build..."
fvm flutter run