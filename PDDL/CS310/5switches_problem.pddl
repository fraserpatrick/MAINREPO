(define (problem five_switches_prob_1)
(:domain five_switches_1)
    
    (:objects
        ;; switches
        switch_1 - switch
        switch_2 - switch
        switch_3 - switch
        switch_4 - switch
        switch_5 - switch
    )    
    (:init
        (off switch_1)
        (on switch_2)
        (off switch_3)
        (on switch_4)
        (off switch_5)

        ;; neighbours
        (neighbours switch_1 switch_2)
        (neighbours switch_2 switch_1)
        (neighbours switch_2 switch_3)
        (neighbours switch_3 switch_2)
        (neighbours switch_3 switch_4)
        (neighbours switch_4 switch_3)
        (neighbours switch_4 switch_5)
        (neighbours switch_5 switch_4)
    )
    (:goal (and
        (on switch_1)
        (on switch_2)
        (on switch_3)
        (on switch_4)
        (on switch_5)
    ))
)