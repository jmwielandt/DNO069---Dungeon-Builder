from glob import Juego
import json

import parameters as p


juego = None

def settings():
    size(p.TILE*8, p.TILE*8, P2D)
    global juego
    juego = Juego()
    

def setup():
    
    noSmooth()
    # noLoop()
    frameRate(60)
    pass


def draw():
    juego.update()
    background(0, 0, 255)
    for i, v in enumerate(juego.mapa.grilla):
        for j, k in enumerate(v):
            if k == 1:
                fill(0)
                rect(i*p.TILE, j*p.TILE, p.TILE, p.TILE)
            else:
                fill(255)
                rect(i*p.TILE, j*p.TILE, p.TILE, p.TILE)
    fill(juego.jug.col)
    rect(juego.jug.x, juego.jug.y, juego.jug.w, juego.jug.h)


def keyPressed():
    juego.cope(True)


def keyReleased():
    juego.cope(False)
