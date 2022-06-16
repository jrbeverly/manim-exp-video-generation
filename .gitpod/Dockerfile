FROM gitpod/workspace-full:latest
USER root

ENV DISPLAY=":1"

RUN python3.8 -m pip install --upgrade pip

RUN apt-get install -y -qq libsdl-pango-dev x11-utils 
RUN pip3 install gym pyvirtualdisplay
RUN apt-get install -y -qq xvfb python-opengl

USER gitpod

RUN pip3 install pytest mock pytest-testdox toml pyglet manimgl