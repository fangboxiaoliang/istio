HUB=ghcr.io/querycap/istio docker.io/querycapistio

gen:
	HUB="$(HUB)" go run github.com/querycap/ci-infra/cmd/imagetools

install:
	go get github.com/querycap/ci-infra/cmd/imagetools@master
