def prox_zero(value, variation):
    if value >= 0:
        return max(value - variation, 0)
    else:
        return min(value + variation, 0)
