import parameters as p

class HitBox:
    def __init__(self, x, y, w, h):
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.speed_x = 0
        self.speed_y = 0
        pass
    
    def move(self):
        self.x += self.speed_x
        self.y += self.speed_y

class Entity(HitBox):
    def __init__(self, x, y, w, h):
        HitBox.__init__(self, x, y, w, h)
        self.col = color(0, 255, 0)
        pass
