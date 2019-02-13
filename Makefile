imageName=my/my-ubuntu
containerName=my-ubuntu
ASTYLE_CONF = ./configs/astyle.conf
 
build:
	docker build -t $(imageName) .
 
stop:
	docker stop -f $(containerName) || true
	docker rm -f $(containerName) || true
 
start:
	make stop
	docker run -d -t -p 8001:22 --name $(containerName) $(imageName) /bin/bash
	docker exec -d $(containerName) bash -c "sh /root/start.sh"
 
root:
	make stop
	docker run --rm -v $(PWD):/root/src \
	--privileged=true \
	-t -i --name $(containerName) $(imageName)  /bin/bash || true

astyle:
	find ./ -name "*.c" | xargs astyle -n --options="$(ASTYLE_CONF)"
	find ./ -name "*.cc" | xargs astyle -n --options="$(ASTYLE_CONF)"

doxygen:
	doxygen configs/doxygen.conf -w docs/html header.html footer.html stylesheet.css

gtest:
	cd src_test
	rm -rf CMakefiles CMakeCache.txt *.cmake
	cmake ./CMakeLists.txt
	make

clean:
	$(S)rm -rf docs/html
	cd src_test
	rm -rf src_test/Makefile
	find ./ -name CMakeCache.txt | xargs rm -rf
	find ./ -name *.cmake | xargs rm -rf
