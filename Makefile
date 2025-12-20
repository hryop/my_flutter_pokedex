#CLEAN GET GENERATE USING FVM
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

init-dir:
	echo "==MAKE CLEAN ARCHITECTURE DIRECTORIES=="
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

