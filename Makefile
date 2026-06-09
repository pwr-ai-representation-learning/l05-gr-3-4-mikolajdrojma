DEVICE = gpu
PORT = 8888
GPU = all

# Set GPU_FLAG based on DEVICE
GPU_FLAG = $(if $(filter-out cpu,$(DEVICE)),--gpus=$(GPU),)

install:
	pip install -r requirements-$(DEVICE).txt

build_image:
	docker build -t representation_learning -f $(DEVICE).dockerfile .


run_container:
	docker run --rm $(GPU_FLAG) -p $(PORT):8888 -p 6006:6006 -p 6007:6007 -p 6008:6008 -v ${CURDIR}:/assignment --name representation_learning representation_learning