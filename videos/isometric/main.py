import os
from pathlib import Path

import manim.utils.opengl as opengl
from manim import *

class MovingDots(Scene):
    def tile(self, x, y, z, coordinate=[0, 0, 0]):
        width = 1
        height = 0.5
        offset = 0

        if x % 2 == 0:
            offset = 0.5

        points = [
            [
                x - width, 
                y + offset, 
                z
            ],
            [
                x, 
                y - height + offset, 
                z
            ],
            [
                x + width, 
                y + offset, 
                z
            ],
            [
                x, 
                y + height + offset, 
                z
            ],
        ]

        for point in points:
            point[0] += coordinate[0]
            point[1] += coordinate[1]
            point[2] += coordinate[2]

        isometric = Polygon(*points)
        isometric.stroke_width = 1
        isometric.set_fill(BLUE, opacity=0.5)
        isometric.set_stroke(YELLOW_B)
        return isometric


    def construct(self):
        length = 9
        width = 16

        offset = [ -8, -4, 0 ]

        polygons = [[0 for k in range(length)] for j in range(width)]
        tiles = []
        for x in range(len(polygons)):
            for y in range(len(polygons[x])):
                tile = self.tile(x, y, 0, coordinate=offset)
                polygons[x][y] = tile
                tiles.append(tile)
            
            self.play(*[Create(poly) for poly in polygons[x]], run_time=0.5)