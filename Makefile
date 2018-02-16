ARM_VERSION=5
PI_DEPLOY_IP=192.168.0.49

clean:
	rm -rf gattaca*

# Host specific
build: clean
	go build

run: build
	./gattaca

# Target host specific (ARM)
build-arm: clean
	env GOARCH=arm GOARM=$(ARM_VERSION) go build

deploy-arm: build-arm
	scp gattaca pi@$(PI_DEPLOY_IP):/home/pi/work/projects
