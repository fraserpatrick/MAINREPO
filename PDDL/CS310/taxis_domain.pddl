(define (domain taxi_simplest)
    ;; typing allows for objects
    (:requirements :typing)

    (:types location taxi person)

    (:predicates
        ;; the properties of a person
        (outsidetaxi ?p - person)
        (plocation ?p - person ?l - location)

        ;; the properties of a taxi
        (tlocation ?t - taxi ?l - location)
        (taxiEmpty ?t - taxi)

        ;; the connections between locations
        (connects ?l1 ?l2 - location)
    )

    (:action move
        :parameters (?t - taxi ?l1 ?l2 - location)
        :precondition (and
            (tlocation ?t ?l1)
            (connects ?l1 ?l2)
        )
        :effect (and
            (not (tlocation ?t ?l1))
            (tlocation ?t ?l2)
        )
    )

    (:action pickup
        :parameters (?t - taxi ?p - person ?l - location)
        :precondition (and
            (tlocation ?t ?l)
            (plocation ?p ?l)
            (outsidetaxi ?p)
            (taxiEmpty ?t)
        )
        :effect (and
            (not (outsidetaxi ?p))
            (not (plocation ?p ?l))
            (tlocation ?t ?l)
            (not (taxiEmpty ?t))
        )
    )
    (:action dropoff
        :parameters (?t - taxi ?p - person ?l - location)
        :precondition (and
            (tlocation ?t ?l)
            (not (outsidetaxi ?p))
        )
        :effect (and
            (outsidetaxi ?p)
            (plocation ?p ?l)
            (taxiEmpty ?t)
        )
    )
)