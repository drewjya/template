custom_lint:
	dart run custom_lint
watch:
	flutter pub get
	dart run build_runner watch
builder:
	flutter pub get
	dart run build_runner build
clean:
	flutter clean
	flutter pub get