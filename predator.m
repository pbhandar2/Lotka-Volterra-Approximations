function z1 = predator(a, b, prey_pop, predator_pop)
    z1 = a*predator_pop + b * predator_pop * prey_pop;
end