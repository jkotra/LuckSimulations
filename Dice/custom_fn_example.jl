function custom_martingale(stake::Float64, res::Bool, )
    if res == false
        return stake+(stake*0.15)
    else
        return stake
end