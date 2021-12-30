applyTimes 0 f b =
    b 
applyTimes n f b =
    f . applyTimes (n-1) f $ b 