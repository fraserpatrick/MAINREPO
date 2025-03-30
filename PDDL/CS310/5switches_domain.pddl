(define (domain five_switches_1)
    ;; typing allows for objects
    (:requirements :typing)
    
    ;; this domain has one type of object
    (:types switch)

    (:predicates
        ;; the properties of a switch
        ;; ? indicates parameter, s is the name which here is a switch
        (off ?s - switch)
        (on ?s - switch)
        (neighbours ?s1 ?s2 - switch)
    )

    ;; this action toggles a switch ON, receives a switch as parameter
    (:action switch_on
        :parameters (?s ?s2 - switch)
        :precondition (and
            (off ?s) 
            (on ?s2)
            (neighbours ?s ?s2)
        )
        :effect (and
            (not (off ?s))
            (on ?s)
        )
    )
    ;; this action toggles a switch OFF, receives a switch as parameter
    (:action switch_off
        :parameters (?s - switch)
        :precondition (and
            (on ?s)
        )
        :effect (and
            (not (on ?s))
            (off ?s)
        )
    )
)