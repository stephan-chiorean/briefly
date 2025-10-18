# Briefly iOS App Makefile

XCODEGEN := $(shell command -v xcodegen 2> /dev/null)

.PHONY: check-xcodegen gen open build run

check-xcodegen:
ifndef XCODEGEN
	@echo "❌ XcodeGen not found. Install with: brew install xcodegen"
	@exit 1
else
	@echo "✅ XcodeGen found at $(XCODEGEN)"
endif

gen: check-xcodegen
	@echo "🔧 Generating Xcode project..."
	xcodegen generate
	@echo "✅ Project generated successfully"

open: gen
	@echo "🚀 Opening Xcode..."
	open Briefly.xcodeproj

build: gen
	@echo "🔨 Building app..."
	xcodebuild -scheme Briefly -destination 'platform=iOS Simulator,name=iPhone 16' build

run:
	@echo "📱 To run the app:"
	@echo "   1. Open Xcode: make open"
	@echo "   2. Select iPhone 16 simulator"
	@echo "   3. Press Cmd+R to run"
