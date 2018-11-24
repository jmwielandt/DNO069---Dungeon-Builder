import json

import entity as e
import funciones as f
import parameters as p

class Juego:
    def __init__(self):
        self.keys = {
            p.IZQUIERDA: False,  # izquierda
            p.DERECHA: False,  # derecha
            p.ARRIBA: False,  # arriba
            p.ABAJO: False,  # abajo
            p.ESPACIO: False}  # espacio
        
        self.mapa = Mapa("data/nivel2.json")
        self.jug = e.Entity(30, 50, 30, 30)
        
        pass
    
    def cope(self, st):
        self.keys[keyCode] = st
    
    def update(self):
        
        self.jug.speed_x = f.prox_zero(self.jug.speed_x, p.ROCE)
        self.jug.speed_y = f.prox_zero(self.jug.speed_y, p.ROCE)
        
        ## CONTINUAR
        if (self.keys[p.IZQUIERDA] and not self.keys[p.DERECHA]):
            LX = self.jug.x // p.TILE
            if LX == 0:
                self.jug.speed_x = max(-p.SPEED, 0 - self.jug.x)
            else:
                self.jug.speed_x = -p.SPEED
        elif (not self.keys[p.IZQUIERDA] and self.keys[p.DERECHA]):
            self.jug.speed_x = p.SPEED
        
        if (self.keys[p.ARRIBA] and not self.keys[p.ABAJO]):
            self.jug.speed_y = -p.SPEED
        elif (not self.keys[p.ARRIBA] and self.keys[p.ABAJO]):
            self.jug.speed_y = p.SPEED
        
        if self.jug.x < 0:
            self.jug.x = 0
        
        self.jug.move()
        
        


class Mapa:
    def __init__(self, file):
        with open(file, "r") as data:
            self.grilla = json.load(data)
        
            
        pass
