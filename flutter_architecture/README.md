# Project overview
## Code generation
The project is relying heavily on code generation

### Run the generator
if you want the generator to run one time and exit use

`flutter packages pub run build_runner build`

Use the `watch` flag to watch the files' system for edits and rebuild as necessary.

`flutter packages pub run build_runner watch`

### Problems with the generation?
Make sure you always Save your files before running the generator, if that does not work you can always try to clean and rebuild.

`flutter packages pub run build_runner clean`

### Packages using code generation
- injectable - for generating DI setup
- json_serializable - for generating serializable POJOs
- retrofit - for generating API client code with Dio

## Localization
Localization is implemented using `flutter_localizations`

Read more [here](https://pascalw.me/blog/2020/10/02/flutter-1.22-internationalization.html)

## DI
DI is supported via `get_it` which is a Service Locator based DI approach. For more info see the [documentation](https://pub.dev/packages/get_it)
`injectable` is used to generate `get_it` configuration using annotations. For more info see the [documentation](https://pub.dev/packages/injectable)

## Networking
json_serializable
dio
retrofit
