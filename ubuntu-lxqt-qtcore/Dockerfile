FROM mylxqt

RUN [ "cross-build-start" ]

# install toolchain and tools
RUN apt-get -y update && apt-get install -y \
	xz-utils \
	python \
	libc6 \
	libc6-dev \
	binutils \
	make \
	libncurses5-dev \
	gcc g++ \
	gcc-multilib \
	git \
	# qt stuff
	qt*5*-dev \
	qt5-qmake && \
	apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

# get qt sources
RUN wget https://download.qt.io/archive/qt/5.11/5.11.1/single/qt-everywhere-src-5.11.1.tar.xz && \
	tar xvf qt-everywhere-src-5.11.1.tar.xz && rm qt-everywhere-src-5.11.1.tar.xz && \
	cd qt-everywhere-src-5.11.1 && \
	./configure -opensource -confirm-license && \
	make -j8 && \
	make install -j8 && \
	PATH=/usr/local/Qt-5.11.1/bin:$PATH && \
	export PATH && \
	cd .. \
	rm -R qt-everywhere-src-5.11.1

RUN [ "cross-build-end" ]
