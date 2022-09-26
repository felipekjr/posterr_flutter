# Felipe Rodrigues do Nascimento

### Posterr
This project was made with [flutter 3.3.1](https://docs.flutter.dev/get-started/install)

--- 

### Run

After connect to a device or emulator, run the command below on terminal:

```console
sh flutter_run.sh
``` 

PS: if you use [FVM](https://fvm.app/) run ```sh flutter_run_fvm.sh``` 

### Critique
 - Use cases frequently only calls repositories, becoming a middleman (anti pattern)
 - Make abstraction for D.I
 - Make a log structure
 - Increase test coverage
 - If the app got multiple crash reports and reviews saying the app is not working properly i would go straight to where the business rules are, in the domain layer. From here, i'd investigate if was a UI performance problem from Flutter or an optimization needed on external layer (e.g. if the local database with Hive was slow, i'd change to other data_source on external layer such as SQLite, SharedPreferences or SecureStorage)
 - This architecture was designed for scalability both the application and the project. It's easy here to improve and fix one layer without impact the others (Clean Arch). If this app grows and it has a remote api i would make a cache structure to change between local and remote data, making the user experience smoothly. I'd also do the pagination for feed, to load posts on demmand while user scrolls on screen.


---

### :bug: Issues

Feel free to **file a new issue** with a respective title and description. If you already found a solution to your problem, **I would love to review your pull request**!

### :tada: Contributing

Check out the [contributing](./CONTRIBUTING.md) page to see the best places to file issues, start discussions and begin contributing.