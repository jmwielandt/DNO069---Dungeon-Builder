import parameters as p


class HitBox:
    def __init__(self, x, y, w, h, parent_grid, mapx, mapy):
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.speed_x = 0
        self.speed_y = 0
        self.pg = parent_grid
        self.mapx = mapx
        self.mapy = mapy
    
    def coords(self):
        return ((floor(self.x/p.TILE), floor(self.y/p.TILE)),
            (floor((self.x + self.w - 0.01)/p.TILE), floor(self.y/p.TILE)),
            (floor(self.x / p.TILE), floor((self.y + self.h - 0.01)/p.TILE)),
            (floor((self.x + self.w - 0.01)/p.TILE), 
             floor((self.y + self.h - 0.01)/p.TILE)))
    
    def move(self, sx, sy):
        pos = self.coords()
        if sx < 0:
            if pos[0][0] == 0:
                sx = max(sx, 0 - self.x)
            else:
                aux1 = self.pg[pos[0][0] - 1][pos[0][1]]
                aux2 = self.pg[pos[2][0] - 1][pos[2][1]]
                if aux1 == 1 or aux2 == 1:
                    sx = max(sx, pos[0][0] * p.TILE - self.x)
        else:
            if pos[1][0] == self.mapx - 1:
                sx = min(sx, self.mapx * p.TILE - self.x)
            else:
                aux1 = self.pg[pos[1][0] + 1][pos[1][1]]
                aux2 = self.pg[pos[3][0] + 1][pos[3][1]]
                if aux1 == 1 or aux2 == 1:
                    sx = min(sx, (pos[1][0] + 1) * p.TILE - (self.x + self.w))
        
        self.speed_x = sx
        self.x += self.speed_x

        if sy < 0:
            if pos[0][1] == 0:
                sy = max(sy, 0 - self.y)
            else:
                aux1 = self.pg[pos[0][0]][pos[0][1] - 1]
                aux2 = self.pg[pos[1][0]][pos[1][1] - 1]
                if aux1 == 1 or aux2 == 1:
                    sy = max(sy, pos[0][1] * p.TILE - self.y)
        else:
            if pos[2][1] == self.mapy - 1:
                sy = min(sy, self.mapy * p.TILE - self.y)
            else:
                aux1 = self.pg[pos[2][0]][pos[2][1] + 1]
                aux2 = self.pg[pos[3][0]][pos[3][1] + 1]
                if aux1 == 1 or aux2 == 1:
                    sy = min(sy, (pos[2][1] + 1) * p.TILE - (self.y + self.h))
        
        self.speed_y = sy
        self.y += self.speed_y
        
        if self.x < 0:
            self.x = 0
        elif self.x + self.w >= width or self.x + self.w >= self.mapx * p.TILE:
            self.x = min(width, self.mapx * p.TILE) - self.w
        
        if self.y < 0:
            self.y = 0
        elif self.y + self.h >= height or self.y + self.h >= self.mapy * p.TILE:
            self.y = min(height, self.mapy * p.TILE) - self.h


class Entity(HitBox):
    def __init__(self, *args):
        HitBox.__init__(self, *args)
        self.col = color(0, 255, 0)
