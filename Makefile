TEMPLATE_NAME ?= ezstream

shell: image
	docker run -a stdin -a stdout -ti $(TEMPLATE_NAME) /bin/bash

image:
	docker build -t $(TEMPLATE_NAME) .

push:
	docker tag $(TEMPLATE_NAME):latest revmischa/$(TEMPLATE_NAME)
	docker push revmischa/$(TEMPLATE_NAME)
