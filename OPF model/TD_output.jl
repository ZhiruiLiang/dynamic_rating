function save_results(m)
    all_vars = all_variables(m)
    f = open("TD_results/all_vars.txt", "w")
    for v in all_vars
        print(f, "$(v) = $(value(v))\n")
    end
    close(f)

    node_1_price = []
    node_2_price = []
    node_3_price = []
    node_4_price = []

    for t in t_list
        push!(node_1_price, dual(m[:λ1][t]))
        push!(node_2_price, dual(m[:λ2][t]))
        push!(node_3_price, dual(m[:λ3][t]))
        push!(node_4_price, dual(m[:λ4][t]))
    end

    f = open("TD_results/node_1_price.txt", "w")
    for t in t_list
        println(f, node_1_price[t])
    end
    close(f)

    f = open("TD_results/node_2_price.txt", "w")
    for t in t_list
        println(f, node_2_price[t])
    end
    close(f)

    f = open("TD_results/node_3_price.txt", "w")
    for t in t_list
        println(f, node_3_price[t])
    end
    close(f)

    f = open("TD_results/node_4_price.txt", "w")
    for t in t_list
        println(f, node_4_price[t])
    end
    close(f)

end
