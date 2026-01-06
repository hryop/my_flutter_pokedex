fvm-cgg:
	@echo "==CLEAN THE REPOSITORY=="
	fvm flutter clean

	@echo ""
	@echo "==GETTING THE DEPENDENCIES=="
	fvm flutter pub get

	@echo ""
	@echo "==BUILD AND DELETE CONFLICTING OUTPUTS=="
	fvm flutter pub run build_runner build --delete-conflicting-outputs

fvm-run:
	@echo "==RUN APP=="
	fvm flutter run

fvm-lcov:
	@echo "==GENERATE LCOV INFO=="
	fvm flutter test --coverage

gen-lcov:
	@echo "==GENERATE CODE COVERAGE REPORT=="
	perl C:\ProgramData\chocolatey\lib\lcov\tools\bin\genhtml -o coverage\html coverage\lcov.info
	@echo "==OPEN CODE COVERAGE REPORT=="
	start coverage\html\index.html

init-dir:
	echo "==INITIALIZED BASE DIRECTORY FOR CLEAN ARCHITECTURE=="
	mkdir lib\core
	mkdir lib\features
	mkdir lib\shared

	mkdir lib\core\helper
	mkdir lib\core\network
	mkdir lib\core\styles
	mkdir lib\core\utils

	mkdir lib\core\helper\go_router

	mkdir lib\core\network\error

	mkdir lib\core\utils\constant
	mkdir lib\core\utils\log
	mkdir lib\core\utils\usecase

	mkdir lib\shared\data\data_source
	mkdir lib\shared\domain\entities
	mkdir lib\shared\presentation

	mkdir lib\features\features_a\data\data_source\remote
	mkdir lib\features\features_a\data\repositories

	mkdir lib\features\features_a\domain\models
	mkdir lib\features\features_a\domain\repositories
	mkdir lib\features\features_a\domain\usecase

	mkdir lib\features\features_a\presentation\bloc
	mkdir lib\features\features_a\presentation\pages
	mkdir lib\features\features_a\presentation\widget

	mkdir assets\svg_images

fvm-init-dep:
	echo "==INITIALIZED ADDING MANDATORY DEPENDENCY=="
	fvm flutter pub add build_runner
	fvm flutter pub add go_router
	fvm flutter pub add dio
	fvm flutter pub add json_annotation
	fvm flutter pub add json_serializable
	fvm flutter pub add get_it
	fvm flutter pub add freezed
	fvm flutter pub add equatable
	fvm flutter pub add shared_preferences
	fvm flutter pub add flutter_bloc

	fvm flutter pub add dartz
	fvm flutter pub add intl
	fvm flutter pub add cached_network_image
	fvm flutter pub add flutter_svg

	fvm flutter pub add pull_to_refresh
	fvm flutter pub add shimmer
	fvm flutter pub add flutter_screenutil





