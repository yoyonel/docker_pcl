FROM ubuntu:14.04

MAINTAINER yoyonel

RUN apt-get -y update && apt-get -y install \
	g++  \
	cmake cmake-gui  \
	doxygen    \
	mpi-default-dev openmpi-bin openmpi-common    \
	libflann1.8 libflann-dev  \
	libeigen3-dev  \
	libboost-all-dev  \
	libvtk5.8-qt4 libvtk5.8 libvtk5-dev  \
	libqhull*  \
	libgtest-dev  \
	git-core freeglut3-dev pkg-config  \
	build-essential libxmu-dev libxi-dev   \
	graphviz mono-complete  \
	qt-sdk openjdk-7-jdk openjdk-7-jre  \
	phonon-backend-gstreamer  \
	phonon-backend-vlc

WORKDIR /root
RUN git clone --depth=50 --branch=master https://github.com/PointCloudLibrary/pcl.git PointCloudLibrary/pcl
WORKDIR /root/PointCloudLibrary
RUN mkdir -p ./build/release
WORKDIR /root/PointCloudLibrary/build/release
RUN cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON /root/PointCloudLibrary/pcl
RUN make -j3
RUN make install -j3